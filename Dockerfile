FROM fedora:27
# Need to upgrade, because of some problems with pip.
# && dnf -y upgrade --refresh  \

RUN set -ex \
 && dnf -y install 'dnf-command(copr)' \
 && dnf -y copr enable petersen/pandoc \
 && dnf -y install \
        pandoc \
 && /usr/bin/pip3 install -U pip pipenv tox \
 && rm -rf /var/cache/* /root/.cache /tmp/.[A-Za-z]* /tmp/* \
 && echo "Done"
