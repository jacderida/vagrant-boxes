#!/usr/bin/env bash

echo "export CMAKE_BUILD_TYPE=Release" >> ~/.bashrc
echo "export CMAKE_C_COMPILER=/usr/bin/gcc" >> ~/.bashrc
echo "export CMAKE_CXX_COMPILER=/usr/bin/g++" >> ~/.bashrc
echo "export CMAKE_INSTALL_PREFIX=/usr" >> ~/.bashrc
git clone https://github.com/coelckers/prboom-plus
