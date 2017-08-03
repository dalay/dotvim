#!/bin/bash

VIM_DIR=~/.vim
# VIM_REPO=https://github.com/dalay/dotvim.git
# git clone $VIM_REPO $VIM_DIR

ln -s $VIM_DIR/.vimrc ~/.vimrc

cd $VIM_DIR
git submodule update --init && vim -c 'PluginInstall' -c 'qa!'

cd $VIM_DIR/bundle/Vundle.vim/·
git checkout master
