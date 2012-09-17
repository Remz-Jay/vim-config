#!/bin/bash

# Take home dir as parameter for use in puppet script
if [[ -z $1 ]]
then
	home=~
else
	home=$1
fi

# Create symlinks
if [ -e $home/.vim ] || [ -L $home/.vim ]
then
	rm -rf $home/.vim
fi
if [ -e $home/.vimrc ] || [ -L $home/.vimrc ]
then
	rm -f $home/.vimrc
fi
ln -s $home/${PWD##*/}/.vim $home/.vim
ln -s $home/${PWD##*/}/.vimrc $home/.vimrc

# Initialize submodules
git submodule update --init

# Compile command-t for our ruby version
cd $home/${PWD##*/}/.vim/bundle/Command-T/ruby/command-t
ruby extconf.rb
make
