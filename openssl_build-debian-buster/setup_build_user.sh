#!/usr/bin/env bash
export OPENSSL_VERSION=1.0.2r

curl -L -O https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
chmod +x rustup-init
./rustup-init --default-toolchain 1.35.0 --no-modify-path -y
~/.cargo/bin/rustup target add x86_64-unknown-linux-musl

echo "export CC=musl-gcc" >> ~/.bashrc
echo "export C_INCLUDE_PATH=/usr/local/musl/include/" >> ~/.bashrc
echo "source ~/.cargo/env" >> ~/.bashrc
echo "export OPENSSL_LIB_DIR=/usr/local/x86_64-linux-gnu" >> ~/.bashrc
echo "export OPENSSL_INCLUDE_DIR=/usr/include/openssl" >> ~/.bashrc

curl -LO "https://www.openssl.org/source/openssl-$OPENSSL_VERSION.tar.gz"
tar xvzf "openssl-$OPENSSL_VERSION.tar.gz"
#git clone https://github.com/openssl/openssl.git
