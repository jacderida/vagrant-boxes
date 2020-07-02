#!/usr/bin/env bash

set -e

wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
    -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb

apt-get update -y
apt-get install -y apt-transport-https
apt-get update -y
apt-get install -y dotnet-sdk-3.1
