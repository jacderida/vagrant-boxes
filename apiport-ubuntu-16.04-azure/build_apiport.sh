#!/usr/bin/env bash

set -e

git clone https://github.com/microsoft/dotnet-apiport.git
cd dotnet-apiport
./build.sh

echo 'alias apiport="dotnet /home/vagrant/dotnet-apiport/bin/Debug/ApiPort/netcoreapp2.1/ApiPort.dll"' \
    >> ~/.bashrc
