#!/usr/bin/env bash

apt-get install -y apt-file \
    gcc \
    git \
    libc6-dev-i386 \
    libssl-dev \
    make \
    musl-tools \
    pkg-config \
    vim
apt-file update
[[ ! -f "/usr/include/openssl/opensslconf.h" ]] && ln -s \
    /usr/include/x86_64-linux-gnu/openssl/opensslconf.h \
    /usr/include/openssl/opensslconf.h
