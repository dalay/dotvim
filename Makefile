VIMRC=`pwd`/.vimrc

install:
	@ln -s $(VIMRC) $(HOME)/.vimrc
	@vim -c ':PlugInstall --sync | :qa!'

update: plug-upgrade
	@vim -c ':PlugUpdate | :qa!'

upgrade: plug-clean plug-install update

plug-upgrade:
	@vim -c ':PlugUpgrade | :qa!'

plug-clean:
	@vim -c ':PlugClean | :qa!'

plug-install:
	@vim -c ':PlugInstall | :qa!'

.PHONY: install update upgrade plug-upgrade plug-clean plug-install
