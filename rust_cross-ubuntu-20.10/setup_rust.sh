#!/usr/bin/env bash

curl -L -O https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
chmod +x rustup-init
./rustup-init --default-toolchain stable --no-modify-path -y

echo "source ~/.cargo/env" >> ~/.bashrc
source ~/.cargo/env
cargo install cross
