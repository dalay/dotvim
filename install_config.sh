#!/bin/bash

# VIM_REPO=https://github.com/dalay/dotvim.git
VIM_DIR=~/.vim

# git clone $VIM_REPO $VIM_DIR

ln -s $VIM_DIR/.vimrc ~/.vimrc

cd VIM_DIR

git submodule update --init

vim  -c 'PluginInstall' \
     -c 'qa!' 
