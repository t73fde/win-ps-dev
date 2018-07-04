FROM fedora:28
# Need to upgrade, because of some problems with pip.
# && dnf -y upgrade --refresh  \

RUN set -ex \
 && echo "Start - $(date  +%Y%m%dZ%H%M%S)" \
 && dnf -y install dnf-plugins-core \
 && dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo \
 && dnf -y install 'dnf-command(copr)' \
 && dnf -y copr enable petersen/pandoc \
 && dnf -y install \
        docker-ce \
        findutils \
        git \
        pandoc \
        postgresql \
        sudo \
        which \
        python3-tox \
        pipenv \
 && rm -f /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python \
 && rm -f /usr/bin/pip && ln -s /usr/bin/pip-3 /usr/bin/pip \
 && /usr/bin/pip install -U "pip<10,>=9.0.3" \
        black \
        pydocstyle \
        flake8 \
        flake8-bugbear \
        flake8-import-order \
        mccabe \
        dodgy \
        coverage \
        pylint \
        pylint-django \
        astroid \
        mypy \
 && rm -rf /var/cache/* /root/.cache /tmp/.[A-Za-z]* /tmp/* \
 && echo "Done - $(date  +%Y%m%dZ%H%M%S)"
