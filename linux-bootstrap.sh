#!/bin/bash

# Take home dir as parameter for use in puppet script
if [[ -z $1 ]]
then
	home=~
else
	home=$1
fi

if [ -e $home/.vim ] || [ -L $home/.vim ]
then
	rm -rf $home/.vim
fi
if [ -e $home/.vimrc ] || [ -L $home/.vimrc ]
then
	rm -f $home/.vimrc
fi
ln -s ${PWD##*/}/.vim $home/.vim
ln -s ${PWD##*/}/.vimrc $home/.vimrc
#git submodule update --init
