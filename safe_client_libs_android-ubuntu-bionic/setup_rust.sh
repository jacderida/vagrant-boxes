#!/usr/bin/env bash

curl -L -O https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
chmod +x rustup-init
./rustup-init --default-toolchain stable --no-modify-path -y
~/.cargo/bin/rustup target add armv7-linux-androideabi

echo "export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu" >> ~/.bashrc
echo "export OPENSSL_INCLUDE_DIR=/usr/include/openssl" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/bin/android-toolchains/bin" >> ~/.bashrc
echo "export CARGO_TARGET_ARMV7_LINUX_ANDROIDEABI_LINKER=/usr/local/bin/android-toolchains/bin/arm-linux-androideabi-gcc" >> ~/.bashrc
echo "export CC=arm-linux-androideabi-clang" >> ~/.bashrc
echo "source ~/.cargo/env" >> ~/.bashrc
git clone https://github.com/jacderida/safe_client_libs
