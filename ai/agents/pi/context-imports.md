# background

I have a central library of content files, commands and skills for agents: `/Users/zach/Documents/denv/dotfiles/ai/lib`

So, for example, instead of maintaining separate context files for each agent, I simply symlink back to a shared context file:

```sh
~/.codex/AGENTS.md  -> /Users/zach/Documents/denv/dotfiles/ai/lib/rules/general.md
~/.claude/CLAUDE.md -> /Users/zach/Documents/denv/dotfiles/ai/lib/rules/general.md
```

Works pretty well, but agents need their own specific instructions as well. For example, Pi undesirably defaults to outputting curly / typographic quotes such as `\u2018`, `\u2019`, etc. I don't wish to update `general.md` w/ Pi-specific instructions. Rather, better for [context files to work like programming langauge imports](https://code.claude.com/docs/en/memory#import-additional-files).

# before / after

```diff
# /Users/zach/.pi/agent
- AGENTS.md -> /Users/zach/Documents/denv/dotfiles/ai/lib/rules/general.md
+ AGENTS.md -> /Users/zach/Documents/denv/dotfiles/ai/agents/pi/user.md
```

```sh
# /Users/zach/Documents/denv/dotfiles/ai/agents/pi
$ cat user.md

@/Users/zach/Documents/denv/dotfiles/ai/lib/rules/general.md
@/Users/zach/Documents/denv/dotfiles/ai/lib/rules/fs.md
@/Users/zach/Documents/denv/dotfiles/ai/lib/rules/output-fmt.md

$ pi

[CONTEXT]
  ~/.pi/agent/AGENTS.md
  ai/lib/rules/general.md
  ai/lib/rules/fs.md
  ai/lib/rules/output-fmt.md

[EXTENSIONS]
  context-imports.ts
```

# overview

Handles imports like `@path/to/file` in context/rule files (AGENTS.md, CLAUDE.md, etc.). Cribbing this idea from [Claude's memory imports](https://code.claude.com/docs/en/memory#import-additional-files).

Adds a custom startup header that shows context files, expanded imports, and this extension.

* before:
```sh
$ pi --no-extensions --no-skills --no-prompt-templates --no-themes

pi v0.78.0
escape interrupt · ctrl+c/ctrl+d clear/exit · / commands · ! bash · ctrl+o more
Press ctrl+o to show full startup help and loaded resources.

Pi can explain its own features and look up its docs. Ask it how to use or extend Pi.

[Context]
  ~/.pi/agent/AGENTS.md
```

* after:
```sh
[CONTEXT]
  ~/.pi/agent/AGENTS.md
  ai/lib/rules/general.md
  ai/lib/rules/fs.md

[EXTENSIONS]
  context-imports.ts
```

# usage

Paths resolve relative to the file containing the import.

supports:

* relative paths
* absolute paths
* `~/...`
* recursive imports
* cycle detection
* max depth of 10

# impl

* scans context files on `session_start`
* expands/import-scans @... references immediately
* replaces the raw context-file block in the system prompt before each agent turn
* modifies system prompt @ `before_agent_start`
* uses `ctx.ui.setHeader()` to replace Pi's logo/help/onboarding header
* renders gold `[CONTEXT]` with Pi context files followed by expanded imports
* renders gold `[EXTENSIONS]` with `context-imports.ts`
* custom header rendering is UI-only; prompt injection still happens separately in `before_agent_start`
* imports are wrapped with HTML comments in the prompt so the model can see file boundaries
* `/context-imports` was removed; warnings are shown inline in the custom header and as UI notifications

## paths

Pi loads context files before extensions can mutate `systemPromptOptions.contextFiles`. This extension therefore does two related but separate things:

* _display path_: it independently discovers context files on `session_start`, expands imports for metadata only, and renders a custom `[CONTEXT]` / `[EXTENSIONS]` header.
* _model path_: it expands imports again during `before_agent_start` and replaces the corresponding `<project_instructions ...>` block in the system prompt.

Because these paths are separate, any future change to import resolution should update both discovery/header behavior and prompt-replacement behavior.

## quietStartup

Design constraints:

* `ctx.ui.setHeader()` only replaces Pi's logo/help/onboarding header.
* Pi's `[Context]` / `[Extensions]` resource listing is rendered separately after extensions bind.
* With `quietStartup: false`, our custom `[CONTEXT]` plus Pi's built-in `[Context]` both show, causing duplicated startup output.
* With `quietStartup: true`, Pi suppresses the built-in loaded-resource listing and the extension-provided header becomes the only startup resource display.
* Because `quietStartup` is global, launching with `--no-extensions` also suppresses Pi's normal startup output; use `--verbose` for diagnostic no-extension launches:

```sh
pi --verbose --no-extensions --no-skills --no-prompt-templates --no-themes
```

Decision:

* Set `"quietStartup": true` in `~/.pi/agent/settings.json`.
* Accept that no-extension runs need `--verbose` when startup output matters.
* This is the only extension-only path to the desired non-duplicated output.

Alternatives considered:

1. Keep `quietStartup: false` and render only `[CONTEXT IMPORTS]` from the extension; rejected because desired output is a single consolidated `[CONTEXT]` / `[EXTENSIONS]` block.
2. Modify Pi core / extension API so extensions can mutate or suppress the loaded-resource listing; best long-term fix, but out of scope for this local extension.
