FROM fedora:27
# Need to upgrade, because of some problems with pip.
# && dnf -y upgrade --refresh  \

RUN set -ex \
 && dnf -y install dnf-plugins-core \
 && dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo \
 && dnf -y install 'dnf-command(copr)' \
 && dnf -y copr enable petersen/pandoc \
 && dnf -y install \
        docker-ce \
        git \
        pandoc \
        postgresql \
        sudo \
        which \
 && ln -s /usr/bin/python3 /usr/bin/python \
 && ln -s /usr/bin/pip-3 /usr/bin/pip \
 && /usr/bin/pip3 install -U pip \
        pipenv \
        pydocstyle \
        flake8 \
        dodgy \
        coverage \
        "pylint<1.8" \
        "pylint-django<0.9" \
        "astroid<1.6" \
        mypy \
        tox \
 && rm -rf /var/cache/* /root/.cache /tmp/.[A-Za-z]* /tmp/* \
 && echo "Done"
