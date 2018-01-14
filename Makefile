VIMRC=`pwd`/.vimrc

install:
	@ln -s $(VIMRC) $(HOME)/.vimrc
	@vim -c ':PlugInstall --sync | :qa!'

update: upgrade clean
	@vim -c ':PlugUpdate | :qa!'

upgrade:
	@vim -c ':PlugUpgrade | :qa!'

clean:
	@vim -c ':PlugClean | :qa!'

.PHONY: install update upgrade clean
