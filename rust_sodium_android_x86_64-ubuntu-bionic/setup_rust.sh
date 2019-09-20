#!/usr/bin/env bash

curl -L -O https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
chmod +x rustup-init
./rustup-init --default-toolchain stable --no-modify-path -y
~/.cargo/bin/rustup target add x86_64-linux-android

echo "export OPENSSL_LIB_DIR=/usr/lib/x86_64-linux-gnu" >> ~/.bashrc
echo "export OPENSSL_INCLUDE_DIR=/usr/include/openssl" >> ~/.bashrc
echo "export PATH=$PATH:/usr/local/bin/android-toolchains/bin" >> ~/.bashrc
echo "export CARGO_TARGET_X86_64_LINUX_ANDROID_LINKER=x86_64-linux-android-clang" >> ~/.bashrc
echo "export CFLAGS='-I /usr/include -idirafter /usr/include/x86_64-linux-gnu'" >> ~/.bashrc
echo "export CC=x86_64-linux-android-clang" >> ~/.bashrc
echo "source ~/.cargo/env" >> ~/.bashrc
[[ ! -d "rust_sodium" ]] && git clone https://github.com/maidsafe/rust_sodium
