#!/usr/bin/env bash

set -e

apt-get update -y

curl -L -O https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
apt-get update -y
apt-get install -y apt-transport-https
apt-get update -y
apt-get install -y dotnet-sdk-2.2
