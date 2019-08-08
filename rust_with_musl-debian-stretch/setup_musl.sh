#!/usr/bin/env bash

apt-get install -y apt-file \
    gcc \
    git \
    libssl-dev \
    musl-dev \
    musl-tools \
    vim
apt-file update
[[ ! -f "/usr/include/openssl/opensslconf.h" ]] && ln -s \
    /usr/include/x86_64-linux-gnu/openssl/opensslconf.h \
    /usr/include/openssl/opensslconf.h
