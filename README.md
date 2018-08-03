# win-ps-dev
Base image for development related tasks.

Installed software:

* Fedora
* General tools: Docker, Git, Pandoc, PostgreSQL-Client, sudo which
* Python tools: pipenv, pydocstyle, dodgy, coverage, PyLint, mypy

Flake8 and autopep8 should currently be installed via Pipenv in your own
container. Both depend on pycodestyle, but have different version requirements.
