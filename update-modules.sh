#!/bin/sh
git submodule update --init --recursive
git submodule foreach git fetch --all
git submodule foreach git reset --hard origin/master
cd .vim/bundle/powerline
git reset --hard origin/develop
cd ../../../powerline-shell
./install.py
cd ../
git status
