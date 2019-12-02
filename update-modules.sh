#!/bin/sh
git submodule update --init --recursive
git submodule foreach git fetch --all
git submodule foreach git reset --hard origin/master
fc-cache -vf ./powerline-fonts
git status
