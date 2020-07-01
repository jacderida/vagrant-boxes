#!/usr/bin/env bash

apt-get install -y npm
npm cache clean -f
npm install -g n
n 10.13.0
