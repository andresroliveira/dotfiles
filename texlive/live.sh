#!/bin/sh

set -xe

sudo mkdir -p /usr/local/texlive/$(date +%Y)

sudo chown -R "$USER" /usr/local/texlive

mkdir -p /tmp/texlive

cd /tmp/texlive

wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz

zcat < install-tl-unx.tar.gz | tar xf -

cd install-tl-2*

perl ./install-tl --no-interaction



