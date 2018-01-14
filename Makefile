VIMRC=`pwd`/.vimrc

install:
	@ln -s $(VIMRC) $(HOME)/.vimrc
	@vim -c ':PlugInstall --sync | :qa!'

.PHONY: install
