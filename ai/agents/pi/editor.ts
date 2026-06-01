/**
 * vi/readline-like modal editing for Pi.
 *
 * Intended to feel like the zsh readline vi setup in:
 *   shell/zsh/modules/readline.sh
 *
 * - Starts in insert mode with a beam cursor
 * - Escape switches insert → normal mode with a block cursor
 * - Submit/agent work/shutdown reset the cursor to the terminal default
 * - Normal mode supports a practical readline-ish vi subset:
 *   h/j/k/l, arrows, 0/^/$, w/b/e, i/a/I/A, x/X, D/C, dd/cc, dw/cw,
 *   u, counts, and operator-count × motion-count composition (2d3w = 6w)
 */

import { CustomEditor, type ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { matchesKey, truncateToWidth, visibleWidth } from "@earendil-works/pi-tui";

const CURSOR_DEFAULT = "\x1b[0 q";
const CURSOR_BLOCK = "\x1b[2 q";
const CURSOR_BEAM = "\x1b[6 q";

type Mode = "normal" | "insert";
type Operator = "d" | "c";
type Motion = "h" | "j" | "k" | "l" | "0" | "^" | "$" | "w" | "b" | "e";

function writeCursorShape(sequence: string): void {
	if (process.stdout.isTTY) process.stdout.write(sequence);
}

function isPrintable(data: string): boolean {
	return data.length === 1 && data.charCodeAt(0) >= 32;
}

function parseCount(raw: string): number {
	const parsed = raw.length > 0 ? Number.parseInt(raw, 10) : 1;
	return Number.isFinite(parsed) && parsed > 0 ? parsed : 1;
}

class ModalEditor extends CustomEditor {
	private mode: Mode = "insert";
	private count = "";
	private pendingOperator: Operator | undefined;
	private operatorCount = 1;

	getMode(): Mode {
		return this.mode;
	}

	applyCursorShape(): void {
		writeCursorShape(this.mode === "normal" ? CURSOR_BLOCK : CURSOR_BEAM);
	}

	private resetPending(): void {
		this.count = "";
		this.pendingOperator = undefined;
		this.operatorCount = 1;
	}

	private setMode(mode: Mode): void {
		this.mode = mode;
		this.resetPending();
		this.applyCursorShape();
		this.tui.requestRender();
	}

	private takeCount(): number {
		const count = parseCount(this.count);
		this.count = "";
		return count;
	}

	private input(sequence: string, times = 1): void {
		for (let i = 0; i < times; i++) super.handleInput(sequence);
	}

	private lineStart(): void {
		this.input("\x01"); // ctrl+a
	}

	private lineEnd(): void {
		this.input("\x05"); // ctrl+e
	}

	private deleteCharForward(times = 1): void {
		this.input("\x1b[3~", times); // delete
	}

	private deleteCharBackward(times = 1): void {
		this.input("\x7f", times); // backspace
	}

	private deleteToLineEnd(): void {
		this.input("\x0b"); // ctrl+k
	}

	private deleteCurrentLine(times = 1): void {
		for (let i = 0; i < times; i++) {
			this.lineStart();
			this.deleteToLineEnd();
			// If the editor is multi-line and the line is now empty, forward-delete
			// once to join/remove the newline. On a single-line prompt this is a no-op.
			this.deleteCharForward();
		}
	}

	private move(motion: Motion, count = 1): void {
		switch (motion) {
			case "h":
				this.input("\x1b[D", count);
				return;
			case "j":
				this.input("\x1b[B", count);
				return;
			case "k":
				this.input("\x1b[A", count);
				return;
			case "l":
				this.input("\x1b[C", count);
				return;
			case "0":
			case "^":
				this.lineStart();
				return;
			case "$":
				this.lineEnd();
				return;
			case "w":
				this.input("\x1bf", count); // alt+f
				return;
			case "b":
				this.input("\x1bb", count); // alt+b
				return;
			case "e":
				// Readline has no direct vi-ish "e" motion; approximate via w then h.
				for (let i = 0; i < count; i++) {
					this.input("\x1bf");
					this.input("\x1b[D");
				}
				return;
		}
	}

	private runOperator(motion: string): boolean {
		const op = this.pendingOperator;
		if (!op) return false;

		const operatorCount = this.operatorCount;
		const motionCount = this.takeCount();
		const count = operatorCount * motionCount;
		this.pendingOperator = undefined;
		this.operatorCount = 1;

		if (motion === op) {
			this.deleteCurrentLine(count);
			if (op === "c") this.setMode("insert");
			else this.tui.requestRender();
			return true;
		}

		if (motion === "$") {
			this.deleteToLineEnd();
			if (op === "c") this.setMode("insert");
			else this.tui.requestRender();
			return true;
		}

		if (motion === "w" || motion === "e") {
			this.input("\x1bd", count); // alt+d = delete word forward
			if (op === "c") this.setMode("insert");
			else this.tui.requestRender();
			return true;
		}

		if (motion === "b") {
			this.input("\x17", count); // ctrl+w = delete word backward
			if (op === "c") this.setMode("insert");
			else this.tui.requestRender();
			return true;
		}

		if (motion === "h") {
			this.deleteCharBackward(count);
			if (op === "c") this.setMode("insert");
			else this.tui.requestRender();
			return true;
		}

		if (motion === "l") {
			this.deleteCharForward(count);
			if (op === "c") this.setMode("insert");
			else this.tui.requestRender();
			return true;
		}

		// Unknown motion after an operator: cancel the operator without inserting text.
		this.resetPending();
		this.tui.requestRender();
		return true;
	}

	handleInput(data: string): void {
		// Keep the cursor shaped correctly when returning from a render/agent turn.
		this.applyCursorShape();

		if (matchesKey(data, "escape")) {
			if (this.mode === "insert") {
				this.setMode("normal");
				return;
			}

			// In vi normal mode, Esc first cancels pending command state. A plain
			// normal-mode Esc falls through to Pi's app interrupt/abort handling.
			if (this.pendingOperator || this.count) {
				this.resetPending();
				this.applyCursorShape();
				this.tui.requestRender();
				return;
			}
			writeCursorShape(CURSOR_DEFAULT);
			super.handleInput(data);
			return;
		}

		if (this.mode === "insert") {
			// readline preexec analogue: leave a clean cursor while Pi runs the turn.
			if (matchesKey(data, "enter")) writeCursorShape(CURSOR_DEFAULT);
			super.handleInput(data);
			return;
		}

		// Submit from normal mode too, like vi/readline. Other app shortcuts still pass through below.
		if (matchesKey(data, "enter")) {
			writeCursorShape(CURSOR_DEFAULT);
			super.handleInput(data);
			return;
		}

		// Normal-mode counts. Bare 0 is a motion; non-bare 0 extends the count.
		if (/^[1-9]$/.test(data) || (data === "0" && this.count.length > 0)) {
			this.count += data;
			this.tui.requestRender();
			return;
		}

		if (this.runOperator(data)) return;

		const count = this.takeCount();

		switch (data) {
			// mode switches
			case "i":
				this.setMode("insert");
				return;
			case "a":
				this.move("l");
				this.setMode("insert");
				return;
			case "I":
				this.lineStart();
				this.setMode("insert");
				return;
			case "A":
				this.lineEnd();
				this.setMode("insert");
				return;

			// motions
			case "h":
			case "j":
			case "k":
			case "l":
			case "0":
			case "^":
			case "$":
			case "w":
			case "b":
			case "e":
				this.move(data, count);
				this.tui.requestRender();
				return;
			case " ":
				this.move("l", count);
				this.tui.requestRender();
				return;
			case "\x7f":
				this.move("h", count);
				this.tui.requestRender();
				return;

			// edits
			case "x":
				this.deleteCharForward(count);
				this.tui.requestRender();
				return;
			case "X":
				this.deleteCharBackward(count);
				this.tui.requestRender();
				return;
			case "D":
				this.deleteToLineEnd();
				this.tui.requestRender();
				return;
			case "C":
				this.deleteToLineEnd();
				this.setMode("insert");
				return;
			case "d":
			case "c":
				this.pendingOperator = data;
				this.operatorCount = count;
				this.tui.requestRender();
				return;
			case "u":
				this.input("\x1f"); // ctrl+-/ctrl+_ undo in most terminals
				this.tui.requestRender();
				return;
		}

		// App shortcuts (ctrl+c, ctrl+d, model selector, etc.) should still work.
		// Ignore unmapped printable chars so normal mode does not insert text.
		if (isPrintable(data)) return;
		writeCursorShape(CURSOR_DEFAULT);
		super.handleInput(data);
	}

	render(width: number): string[] {
		const lines = super.render(width);
		if (lines.length === 0) return lines;

		const pending = this.pendingOperator ? ` ${this.pendingOperator}` : "";
		const count = this.count ? ` ${this.count}` : "";
		const label = this.mode === "normal" ? ` NORMAL${pending}${count} ` : " INSERT ";
		const last = lines.length - 1;
		if (visibleWidth(lines[last]!) >= label.length) {
			lines[last] = truncateToWidth(lines[last]!, width - label.length, "") + label;
		}
		return lines;
	}
}

export default function (pi: ExtensionAPI) {
	let activeEditor: ModalEditor | undefined;
	let activeTui: { getShowHardwareCursor: () => boolean; setShowHardwareCursor: (enabled: boolean) => void } | undefined;
	let restoreHardwareCursor: boolean | undefined;

	pi.on("agent_start", () => writeCursorShape(CURSOR_DEFAULT));
	pi.on("agent_end", () => activeEditor?.applyCursorShape());
	pi.on("session_shutdown", () => {
		if (activeTui && restoreHardwareCursor !== undefined) {
			activeTui.setShowHardwareCursor(restoreHardwareCursor);
		}
		activeEditor = undefined;
		activeTui = undefined;
		writeCursorShape(CURSOR_DEFAULT);
		restoreHardwareCursor = undefined;
	});

	pi.on("session_start", (_event, ctx) => {
		writeCursorShape(CURSOR_BEAM);
		ctx.ui.setEditorComponent((tui, theme, kb) => {
			// Pi positions a hardware cursor for focused editors but may hide it by
			// default. For vi-style beam/block cursor shapes to be visible, opt in.
			activeTui = tui;
			if (restoreHardwareCursor === undefined) restoreHardwareCursor = tui.getShowHardwareCursor();
			tui.setShowHardwareCursor(true);
			activeEditor = new ModalEditor(tui, theme, kb);
			activeEditor.applyCursorShape();
			return activeEditor;
		});
	});
}
