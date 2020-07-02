#!/usr/bin/env bash

cat > ~/.vimrc <<- EOM
set nocompatible
filetype off

filetype plugin indent on
let mapleader=","
syntax on

set background=dark
set backspace=indent,eol,start
set expandtab
set foldlevel=1
set foldmethod=indent
set foldnestmax=10
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nofoldenable
set nowrap
set number
set ruler
set shiftwidth=4
set smartindent
set showcmd
set shortmess+=A
set tabstop=4
set viminfo+=!

nnoremap j gj
nnoremap k gk
EOM
