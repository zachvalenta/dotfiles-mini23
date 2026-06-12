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

## why?

* It's the second-best language for many, many things.
* It's good for sketching:
> A programming language is for thinking of programs, not for expressing programs you've already thought of. It should be a pencil, not a pen. 📙 Paul Graham hackers and painters, page 22
* It's got a great ecosystem:
> The true measure of a language isn’t how it uses semicolons; it’s the standard library of each language. - [Paul Ford](https://www.bloomberg.com/graphics/2015-paul-ford-what-is-code/)
> I think a lot of the advances that happen in programming languages in the next fifty years will have to do with library functions. I think future programming languages will have libraries that are as carefully designed as the core language. Programming language design will not be about whether to make your language strongly or weakly typed, or object oriented, or functional, or whatever, but about how to design great libraries. The kind of language designers who like to think about how to design type systems may shudder at this. It's almost like writing applications! Too bad. Languages are for programmers, and libraries are what programmers need. - [Paul Graham](http://paulgraham.com/popular.html)
