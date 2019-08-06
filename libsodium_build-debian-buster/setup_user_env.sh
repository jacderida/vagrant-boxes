#!/usr/bin/env bash

curl -O https://download.libsodium.org/libsodium/releases/libsodium-1.0.17.tar.gz
tar xvf libsodium-1.0.17.tar.gz
echo "export CC=musl-gcc" >> ~/.bashrc
echo "export CFLAGS='-I/usr/include/x86_64-linux-musl -fPIC'" >> ~/.bashrc
echo "export LDFLAGS=-L/usr/lib/x86_64-linux-musl" >> ~/.bashrc
