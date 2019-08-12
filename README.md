# win-ps-dev
Base image for development related tasks.

Installed software:

* Fedora
* General tools: Docker, Git, Pandoc, PostgreSQL-Devel, sudo, which, gcc
* Python tools: pip, pipenv

Other Python tool should currently be installed via Pipenv in your own
container. Both depend on pycodestyle, but have different version requirements.
