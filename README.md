## Installation
```shell
cd ~
git clone https://github.com/dalay/dotvim.git .vim
cd .vim
git submodule update --init
cd ~
ln -s .vim/.vimrc .vimrc
vim +PluginInstall
```
### or
```shell
cd ~
git clone https://github.com/dalay/dotvim.git .vim
cd .vim
~/.vim/install_config.sh
```
### or
```shell
cd ~
git clone https://github.com/dalay/dotvim.git .vim
cd .vim
make install
```
