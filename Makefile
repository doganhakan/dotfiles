all: sync
sync:
		mkdir -p ~/bash

		[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc
		[ -f ~/.xsession ] || ln -s $(PWD)/xsession ~/.xsession
		[ -d ~/.git-templates/ ] || ln -s $(PWD)/git-templates ~/.git-templates
		[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
		[ -f ~/.bashrc ] || ln -s $(PWD)/bashrc ~/.bashrc
		[ -f ~/bash/bash_aliases ] || ln -s $(PWD)/bash/bash_aliases ~/bash/bash_aliases
		

clean:
		rm -f ~/.vimrc
		rm -f ~/.xsession
		rm -rf ~/.git-templates
		rm -f ~/.gitconfig
		rm -f ~/.bashrc
		rm -rf ~/bash


.PHONY: all clean sync 
