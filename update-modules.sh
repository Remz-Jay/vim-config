#!/bin/sh
rm antigen.zsh
curl -Lq git.io/antigen > antigen.zsh
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
./setup.py install
cd ../
fc-cache -vf ./powerline-fonts
echo Clearing VIM View Cache
find ./.vim/view -type f -exec rm {} +
echo Updating :help documentation
vim -c "Helptags|q"
git status
