#!/usr/bin/env bash

apt-get update -y
apt-get install -y \
    apt-file \
    curl \
    gcc \
    git \
    make \
    musl-dev \
    musl-tools \
    pkg-config \
    vim
apt-file update
