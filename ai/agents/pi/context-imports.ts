import * as fs from "node:fs";
import * as os from "node:os";
import * as path from "node:path";
import type { ExtensionAPI, Theme } from "@earendil-works/pi-coding-agent";

const MAX_DEPTH = 10;
const IMPORT_LINE = /^(\s*)@([^\s`<>"']+)\s*$/;

type ContextFile = {
	path: string;
	content: string;
};

type ImportStats = {
	contextFiles: number;
	contextFilePaths: string[];
	importsExpanded: number;
	importedFiles: string[];
	warnings: string[];
};

function resolveImportPath(specifier: string, fromFile: string): string {
	let raw = specifier.trim();
	if (raw.startsWith("@")) raw = raw.slice(1);

	if (raw === "~") return os.homedir();
	if (raw.startsWith("~/")) return path.join(os.homedir(), raw.slice(2));
	if (path.isAbsolute(raw)) return path.normalize(raw);
	return path.resolve(path.dirname(fromFile), raw);
}

function tryReadFile(filePath: string): { ok: true; content: string; realPath: string } | { ok: false; reason: string } {
	try {
		const stat = fs.statSync(filePath);
		if (!stat.isFile()) return { ok: false, reason: "not a file" };
		return {
			ok: true,
			content: fs.readFileSync(filePath, "utf8"),
			realPath: fs.realpathSync(filePath),
		};
	} catch (error) {
		const message = error instanceof Error ? error.message : String(error);
		return { ok: false, reason: message };
	}
}

function expandImportsInContent(
	content: string,
	fromFile: string,
	stats: ImportStats,
	stack: Set<string>,
	depth: number,
): string {
	if (depth > MAX_DEPTH) {
		const warning = `Max @ import depth (${MAX_DEPTH}) exceeded while expanding ${fromFile}`;
		stats.warnings.push(warning);
		return `<!-- ${warning} -->`;
	}

	return content
		.split(/\r?\n/)
		.map((line) => {
			const match = line.match(IMPORT_LINE);
			if (!match) return line;

			const indent = match[1] ?? "";
			const specifier = match[2];
			const importPath = resolveImportPath(specifier, fromFile);
			const read = tryReadFile(importPath);

			if (!read.ok) {
				const warning = `Could not import ${specifier} from ${fromFile}: ${read.reason}`;
				stats.warnings.push(warning);
				return `${indent}<!-- ${warning} -->`;
			}

			if (stack.has(read.realPath)) {
				const warning = `Skipped cyclic @ import ${importPath}`;
				stats.warnings.push(warning);
				return `${indent}<!-- ${warning} -->`;
			}

			stats.importsExpanded += 1;
			if (!stats.importedFiles.includes(read.realPath)) {
				stats.importedFiles.push(read.realPath);
			}
			stack.add(read.realPath);
			const expanded = expandImportsInContent(read.content, read.realPath, stats, stack, depth + 1);
			stack.delete(read.realPath);

			return [
				`${indent}<!-- BEGIN @${specifier} (${read.realPath}) -->`,
				expanded,
				`${indent}<!-- END @${specifier} -->`,
			].join("\n");
		})
		.join("\n");
}

function expandContextFile(file: ContextFile, stats: ImportStats): ContextFile {
	const initialRealPath = fs.existsSync(file.path) ? fs.realpathSync(file.path) : file.path;
	const stack = new Set<string>([initialRealPath]);
	if (!stats.contextFilePaths.includes(file.path)) {
		stats.contextFilePaths.push(file.path);
	}
	return {
		path: file.path,
		content: expandImportsInContent(file.content, initialRealPath, stats, stack, 0),
	};
}

function loadContextFileFromDir(dir: string): ContextFile | undefined {
	for (const filename of ["AGENTS.md", "AGENTS.MD", "CLAUDE.md", "CLAUDE.MD"]) {
		const filePath = path.join(dir, filename);
		const read = tryReadFile(filePath);
		if (read.ok) {
			return { path: filePath, content: read.content };
		}
	}
}

function discoverContextFiles(cwd: string): ContextFile[] {
	const resolvedCwd = path.resolve(cwd);
	const agentDir = path.resolve(process.env.PI_CODING_AGENT_DIR ?? path.join(os.homedir(), ".pi", "agent"));
	const contextFiles: ContextFile[] = [];
	const seen = new Set<string>();

	const globalContext = loadContextFileFromDir(agentDir);
	if (globalContext) {
		contextFiles.push(globalContext);
		seen.add(globalContext.path);
	}

	const ancestorContextFiles: ContextFile[] = [];
	let currentDir = resolvedCwd;
	const root = path.resolve("/");
	while (true) {
		const contextFile = loadContextFileFromDir(currentDir);
		if (contextFile && !seen.has(contextFile.path)) {
			ancestorContextFiles.unshift(contextFile);
			seen.add(contextFile.path);
		}
		if (currentDir === root) break;
		const parentDir = path.resolve(currentDir, "..");
		if (parentDir === currentDir) break;
		currentDir = parentDir;
	}

	return [...contextFiles, ...ancestorContextFiles];
}

function scanContextImports(cwd: string): ImportStats {
	const contextFiles = discoverContextFiles(cwd);
	const stats: ImportStats = {
		contextFiles: contextFiles.length,
		contextFilePaths: [],
		importsExpanded: 0,
		importedFiles: [],
		warnings: [],
	};
	for (const file of contextFiles) {
		expandContextFile(file, stats);
	}
	return stats;
}

function formatDisplayPath(filePath: string, cwd: string): string {
	const relative = path.relative(cwd, filePath);
	if (relative && !relative.startsWith("..") && !path.isAbsolute(relative)) return relative;
	return filePath.replace(os.homedir(), "~");
}

function renderHeader(stats: ImportStats, cwd: string, theme: Theme): string[] {
	const lines: string[] = [];
	lines.push(theme.fg("warning", "[CONTEXT]"));
	if (stats.contextFilePaths.length === 0 && stats.importedFiles.length === 0) {
		lines.push(`  ${theme.fg("dim", "(none)")}`);
	} else {
		for (const file of stats.contextFilePaths) {
			lines.push(`  ${formatDisplayPath(file, cwd)}`);
		}
		for (const file of stats.importedFiles) {
			lines.push(`  ${formatDisplayPath(file, cwd)}`);
		}
	}
	if (stats.warnings.length > 0) {
		lines.push(theme.fg("warning", `  ${stats.warnings.length} import warning(s)`));
	}
	lines.push("");
	lines.push(theme.fg("warning", "[EXTENSIONS]"));
	lines.push("  context-imports.ts");
	return lines;
}

function emptyStats(): ImportStats {
	return { contextFiles: 0, contextFilePaths: [], importsExpanded: 0, importedFiles: [], warnings: [] };
}

function replaceContextBlocks(systemPrompt: string, original: ContextFile, expanded: ContextFile): string {
	if (original.content === expanded.content) return systemPrompt;

	const oldBlock = `<project_instructions path="${original.path}">\n${original.content}\n</project_instructions>`;
	const newBlock = `<project_instructions path="${expanded.path}">\n${expanded.content}\n</project_instructions>`;

	if (systemPrompt.includes(oldBlock)) {
		return systemPrompt.replace(oldBlock, newBlock);
	}

	// Fallback for unusual prompt construction: replace just the first matching content body.
	return systemPrompt.replace(original.content, expanded.content);
}

export default function contextImports(pi: ExtensionAPI) {
	let lastStats: ImportStats = emptyStats();

	pi.on("session_start", async (_event, ctx) => {
		lastStats = scanContextImports(ctx.cwd);
		if (ctx.hasUI) {
			ctx.ui.setHeader((_tui, theme) => ({
				render: () => renderHeader(lastStats, ctx.cwd, theme),
				invalidate() {},
			}));
		}
	});

	pi.on("before_agent_start", async (event, ctx) => {
		const contextFiles = event.systemPromptOptions.contextFiles ?? [];
		const stats: ImportStats = {
			contextFiles: contextFiles.length,
			contextFilePaths: [],
			importsExpanded: 0,
			importedFiles: [],
			warnings: [],
		};

		let systemPrompt = event.systemPrompt;
		for (const file of contextFiles) {
			const expanded = expandContextFile(file, stats);
			systemPrompt = replaceContextBlocks(systemPrompt, file, expanded);
		}

		lastStats = stats;

		if (stats.warnings.length > 0 && ctx.hasUI) {
			ctx.ui.notify(`context-imports: ${stats.warnings.length} warning(s)`, "warning");
		}

		if (systemPrompt !== event.systemPrompt) {
			return { systemPrompt };
		}
	});
}
