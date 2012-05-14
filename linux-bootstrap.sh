#!/bin/bash
rm -rf ~/.vim
rm ~/.vimrc
ln -s .vim ~/.vim
ln -s .vimrc ~/.vimrc
git submodule update --init
