#!/bin/sh
cd powerline-shell
git stash
cd ..
git submodule update --init --recursive
git submodule foreach git fetch --all
git submodule foreach git reset --hard origin/master
cd .vim/bundle/powerline
git reset --hard origin/develop
cd ../../../powerline-shell
git stash pop
./install.py
cd ../
fc-cache -vf ./powerline-fonts
echo Clearing VIM View Cache
find ./.vim/view -type f -exec rm {} +
git status
