# libraries

* Prefer using the stdlib over third-party libraries. If you must use third-party libraries, prefer libraries already installed in either the current working directory's `pyproject.yml` or globally (`python -m pip list`)
* Use pytest for testing.
* Use httpx for http.
* Use Pathlib for file paths.
* Use Click for CLIs.
* Use rich for styling output.

# general

* Don't use types unless it's crucial to the problem at hand i.e. we're fixing some code that is currently failing due to an issue that stronger typing would solve.
* Include docstrings and doctest for all generated functions and methods.
