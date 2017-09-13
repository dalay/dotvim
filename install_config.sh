#!/bin/bash

CUR_DIR=`pwd`
VIM_DIR=~/.vim

ln -s $VIM_DIR/.vimrc ~/.vimrc
vim -c ':PlugInstall --sync | source $MYVIMRC' -c ':qa!<CR>'
cd $CUR_DIR
