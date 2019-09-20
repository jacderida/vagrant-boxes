#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
apt-get update -y
apt-get install -y gcc git libssl-dev python unzip
if [[ ! -d "/usr/local/bin/android-toolchains/bin" ]]; then
    curl -L -O https://dl.google.com/android/repository/android-ndk-r20-linux-x86_64.zip
    unzip android-ndk-r20-linux-x86_64.zip -d /usr/local/lib
    mkdir /usr/local/bin/android-toolchains
    cd /usr/local/lib/android-ndk-r20/build/tools
    ./make_standalone_toolchain.py --arch x86_64 \
        --api 21 --install-dir /usr/local/bin/android-toolchains --force
fi
