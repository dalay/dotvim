VIMRC=`pwd`/.vimrc
VIMRC_DEST=$(HOME)/.vimrc
VIMDIR_DEST=$(HOME)/.vim/

install:
	@ln -s $(VIMRC) $(VIMRC_DEST)
	@vim -c ':PlugInstall --sync | :qa!'
	@if sudo true; then \
		sudo ln -s $(VIMDIR_DEST) /root/.vim/ \
		sudo ln -s /root/.vim/.vimrc /root/.vimrc \
	fi

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
