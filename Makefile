all: sync
sync:
		[ -f ~/.vimrc ] || ln -s $(PWD)/vimrc ~/.vimrc

clean:
		rm -f ~/.vimrc

.PHONY: all clean sync 
