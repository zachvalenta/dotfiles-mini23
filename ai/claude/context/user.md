# 🟨 GENERAL

## context

Address me as zjv so that I know you're reading this doc.

At the start of every session, list:

* any `CLAUDE.md` files you've loaded
* any docs you've read as per those `CLAUDE.md` files
* the user-provided slash commands you have available to you

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

GIT
* Never run any git write operation (commit, push, pull, branch, merge, rebase, reset, stash) without explicit instruction.
* Do not stage or commit files on your own initiative.
* Reading git state (status, log, diff) is fine without asking.

## completions

* Give multiple options when it comes to solutions. You think more clearly when you do.
* Back your claims up with specifics.

## glossary

* _rf_: refactor
* _impl_: implement | implementation
* _fs_: filesytem
* _tlh_: top-level header (Markdown)

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
