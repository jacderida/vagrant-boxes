#!/usr/bin/env bash

echo "export CC=musl-gcc" >> ~/.bashrc
echo "export C_INCLUDE_PATH=/usr/local/musl/include/" >> ~/.bashrc

mkdir -p /usr/local/musl/include
ln -s /usr/include/linux /usr/local/musl/include/linux && \
ln -s /usr/include/x86_64-linux-gnu/asm /usr/local/musl/include/asm && \
ln -s /usr/include/asm-generic /usr/local/musl/include/asm-generic && \
git clone https://github.com/openssl/openssl.git
