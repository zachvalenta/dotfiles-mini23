# 🟨 GENERAL

## context

Address me as zjv so that I know you're reading this doc.

At the start of every session, list:

* any `GEMINI.md` files you've loaded
* any docs you've read as per those `GEMINI.md` files
* the user-provided skills | slash commands you have available to you

## completions

* Give multiple options when it comes to solutions. You think more clearly when you do.
* Back your claims up with specifics.

## glossary

* _rf_: refactor
* _impl_: implement | implementation
* _fs_: filesytem
* _tlh_: top-level header (Markdown)

# 🔐 PERMS

## packaging

I version control language runtimes and installed packages @ `/Users/zach/Documents/denv/logs`.

Do not install tools on your own. If you'd like to install something new, ask me first and write a log file to the appropriate dir in the above logfiles.

## tools & permissions

__CRITICAL: NEVER use Bash for file operations__

These commands are BLOCKED and will be rejected:
* ❌ `ls` / `find` → ✅ Use `Glob` tool
* ❌ `cat` / `head` / `tail` → ✅ Use `Read` tool
* ❌ `grep` / `rg` → ✅ Use `Grep` tool
* ❌ `sed` / `awk` / `echo >` → ✅ Use `Edit` / `Write` tools

Bash is ONLY for actual shell operations: git, npm, python, docker, etc.

PERMISSIONS
* Do not ask permission for standard read operations - just do them.
* Using specialized tools (Glob, Grep, Read, Edit, Write) avoids permission prompts entirely.

# 🐍 PYTHON

## env

* Use `python`, not `python3`.
* More details on the Python env - Python itself, pip, pipx - is available @ `/Users/zach/Documents/denv/logs/pyenv`.
* Do not create `__pycache__` files.

## general

* Prefer to use single quotes.
* Don't use typing unless it's crucial to the problem at hand i.e. we're fixing some code that is currently failing due to an issue that stronger typing would solve.

## documentation

* include docstrings and doctest for all generated functions and methods
* use the Jetbrains standard:
```python
"""
This line is for an overview

:param arg1: desc of arg1
:return: desc of return
"""
```

## libraries

Prefer using the right library, regardless of whether it is in the stdlib or not.

Prefer these libraries in said domains:

* dataframes: Polars
* CLI: Click
* file paths: Pathlib
* output: rich
* testing: pytest
* HTTP: httpx

And then if things get math-y:

* numerical: jax
* classical ML: scikit
* stats/econ: scipy
* NLP: spacy
* algebra: sympy

# MARKDOWN

## example

Here's an example of how I write Markdown:

```markdown
## architecture

💡 separate db per event: named by `event_id`, isolates event data and promotes parallelism

TYPES
* _event_: live feed data (pbp, markets, stats)
* _rmg_: static reference data (team mappings, trivia)
* _snapshot_: backups of feed data
* _pricing_: player stats, feature mappings
```

You'll notice:

* italics (not bold) for entities like _event_ and _rmg_
* all caps [not followed by a colon] to create something akin to a separate namespace w/in a doubly nested header
* top-level headers are all caps
* second-level headers are only capitalized if they contain a proper noun
```sh
$ ext OLTP.md  # tool I wrote to extract headers from Markdown files

🌐️ DISTRIBUTED / NEWSQL
	🪳 CockroachDB
	🌐 PlanetScale
	🐯 TigerBeetle
```

## nesting

* I disagree w/ the idea of a single top-level header per file. That is a waste of namespace. The file name itself tells one the main topic. No need to repeat with a single top-level header.
* Instead, treat headers like a file system. Top-level, second-level and so on.
* The goal is to have no more than two levels of nesting (top-level, second-level) per document. Typically - but not always - more nesting than that is a sign that your domain is complex enough to merit multiple files vs. greater nesting.
* Any topics that don't fit cleanly under the primary top-level headers for a document - that are miscellaneous - should be grouped under a final top-level leader `# 🟨 ZA` (杂 = miscellaneous).
