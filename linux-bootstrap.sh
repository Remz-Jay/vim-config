#!/bin/bash
rm -rf ~/.vim
rm ~/.vimrc
ln -s ${PWD##*/}/.vim ~/.vim
ln -s ${PWD##*/}/.vimrc ~/.vimrc
git submodule update --init
