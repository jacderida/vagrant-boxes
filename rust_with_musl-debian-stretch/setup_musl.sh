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

#if [[ ! -f "/usr/bin/musl-gcc" ]]; then
    #ln -s /usr/include/x86_64-linux-gnu/openssl/opensslconf.h /usr/include/openssl/opensslconf.h
    #git clone git://git.musl-libc.org/musl
    #(
        #cd musl || exit
        #./configure
        #make
        #make install
        #ln -s /usr/local/musl/bin/musl-gcc /usr/bin/musl-gcc
    #)
#fi
