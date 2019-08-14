#!/usr/bin/env bash

apt-get install -y apt-file \
    gcc \
    git \
    linux-headers-$(uname -r) \
    make \
    musl-dev \
    musl-tools \
    pkg-config \
    vim
apt-file update

mkdir -p /usr/local/musl/include
ln -s /usr/include/linux /usr/local/musl/include/linux
ln -s /usr/include/x86_64-linux-gnu/asm /usr/local/musl/include/asm
ln -s /usr/include/asm-generic /usr/local/musl/include/asm-generic
