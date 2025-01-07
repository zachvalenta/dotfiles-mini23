# libraries

* Prefer using the stdlib over third-party libraries. If you must use third-party libraries, prefer libraries already installed in either the current working directory's `pyproject.yml` or globally (`python -m pip list`)
* testing: pytest
* HTTP: httpx
* file paths: Pathlib
* CLI: Click
* output: rich
* dataframes: Polars
* numerical: jax
* classical ML: scikit
* stats/econ: scipy
* NLP: spacy
* algebra: sympy

# general

* Don't use typing unless it's crucial to the problem at hand i.e. we're fixing some code that is currently failing due to an issue that stronger typing would solve.
* Include docstrings and doctest for all generated functions and methods.
* Prefer to use single quotes.
