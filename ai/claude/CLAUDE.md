# 🟨 GENERAL

## context

Address me as zjv so that I know you're reading this doc.

At the start of every session, list:

* any `CLAUDE.md` files you've loaded
* any docs you've read as per those `CLAUDE.md` files
* the user-provided slash commands you have available to you

## completions

* Give multiple options when it comes to solutions. You think more clearly when you do.
* Back your claims up with specifics.

## Markdown

NESTING
* I disagree w/ the idea of a single top-level header per file. That is a waste of namespace. The file name itself tells one the main topic. No need to repeat with a single top-level header.
* Instead, treat headers like a file system. Top-level, second-level and so on.
* The goal is to have no more than two levels of nesting (top-level, second-level) per document. Typically - but not always - more nesting than that is a sign that your domain is complex enough to merit multiple files vs. greater nesting.

STYLE
* Use single underscore for italics, double underscore for bold.
* Favor shorter codeblocks.

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
