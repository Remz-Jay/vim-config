#!/bin/bash
if [ -e ~/.vim ] || [ -L ~/.vim ]
then
	rm -rf ~/.vim
fi
if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]
then
	rm -f ~/.vimrc
fi
ln -s ${PWD##*/}/.vim ~/.vim
ln -s ${PWD##*/}/.vimrc ~/.vimrc
git submodule update --init
