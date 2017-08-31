#!/bin/bash

# VIM_REPO=https://github.com/dalay/dotvim.git
CUR_DIR=`pwd`
VIM_DIR=~/.vim
# git clone $VIM_REPO $VIM_DIR


ln -s $VIM_DIR/.vimrc ~/.vimrc

cd $VIM_DIR && \
    git submodule update --init && vim -c 'PluginInstall' -c 'qa!' #2>/dev/null

cd $VIM_DIR/bundle/Vundle.vim/ && git checkout master

cd $CUR_DIR
