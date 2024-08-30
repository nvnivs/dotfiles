#!/bin/bash
set -e

# https://github.com/microsoft/vscode-dev-containers/blob/main/containers/hugo/.devcontainer/Dockerfile

# VARIANT can be either 'hugo' for the standard version or 'hugo_extended' for the extended version.
VARIANT=hugo_extended
# VERSION can be either 'latest' or a specific version number
VERSION=latest

case ${VERSION} in
    latest)
        export VERSION=$(curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest | grep "tag_name" | awk '{print substr($2, 3, length($2)-4)}')
        ;;
esac 
echo ${VERSION}

case $(uname -m) in
    aarch64)
        export ARCH=ARM64
        ;;
    *)
        export ARCH=64bit
        ;;
esac
echo ${ARCH}

wget -O /tmp/${VARIANT}-${VERSION}.tar.gz https://github.com/gohugoio/hugo/releases/download/v${VERSION}/${VARIANT}_${VERSION}_Linux-${ARCH}.tar.gz
tar xf /tmp/${VARIANT}-${VERSION}.tar.gz -C /tmp
sudo mv /tmp/hugo /usr/bin/hugo
rm -rf /tmp/${VARIANT}-${VERSION}.tar.gz
