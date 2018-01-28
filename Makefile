VIMRC=`pwd`/.vimrc

install:
	@ln -s $(VIMRC) $(HOME)/.vimrc
	@vim -c ':PlugInstall --sync | :qa!'

update: upgrade
	@vim -c ':PlugUpdate | :qa!'

update-clean: update clean
	@vim -c ':PlugUpdate | :qa!'

upgrade:
	@vim -c ':PlugUpgrade | :qa!'

clean:
	@vim -c ':PlugClean | :qa!'

.PHONY: install update upgrade clean
