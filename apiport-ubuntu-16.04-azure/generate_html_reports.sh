#!/usr/bin/env bash

set -e

cd Debug
find . -name "*.dll" -exec dotnet /home/vagrant/dotnet-apiport/bin/Debug/ApiPort/netcoreapp2.1/ApiPort.dll analyze -f '{}' -r HTML -o '../html/{}.html' \;
find . -name "*.exe" -exec dotnet /home/vagrant/dotnet-apiport/bin/Debug/ApiPort/netcoreapp2.1/ApiPort.dll analyze -f '{}' -r HTML -o '../html/{}.html' \;
