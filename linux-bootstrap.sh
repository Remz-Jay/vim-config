#!/bin/bash

# Take home dir as parameter for use in puppet script
if [[ -z $1 ]]
then
	home=~
else
	home=$1
fi
#Install prerequisites
if [ ! -d $home/powerline-shell ]
then
	cd $home/${PWD##*/}
	git submodule update powerline-shell
	cd $home/${PWD##*/}/powerline-shell && ./install.py
  #Patch the arrow character in the font, as it is currently broken, see:
  #https://github.com/milkbikis/powerline-shell/pull/69
	curl https://github.com/milkbikis/powerline-shell/pull/69.patch | git apply
	cd ..
	ln -s $home/${PWD##*/}/powerline-shell/powerline-shell.py $home/powerline-shell.py
fi
if [ ! -d $home/.oh-my-zsh ]
then
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# Create symlinks
if [ -e $home/.vim ] || [ -L $home/.vim ]
then
	mv $home/.vim $home/.vim.original
fi
if [ -e $home/.vimrc ] || [ -L $home/.vimrc ]
then
	mv $home/.vimrc $home/.vimrc.original
fi
if [ -e $home/.tmux.conf ] || [ -L $home/.tmux.conf ]
then
  mv $home/.tmux.conf $home/.tmux.conf.original
fi
if [ -e $home/.bashrc ] || [ -L $home/.bashrc ]
then
  mv $home/.bashrc $home/.bashrc.original
fi
if [ -e $home/.zshrc ] || [ -L $home/.zshrc ]
then
	mv $home/.zshrc $home/.zshrc.original
fi

ln -s $home/${PWD##*/}/.vim $home/.vim
ln -s $home/${PWD##*/}/.vimrc $home/.vimrc
ln -s $home/${PWD##*/}/.tmux.conf $home/.tmux.conf
ln -s $home/${PWD##*/}/.bashrc $home/.bashrc
ln -s $home/${PWD##*/}/.zshrc $home/.zshrc
 
# Initialize submodules
git submodule update --init --recursive

# Compile command-t for our ruby version
cd $home/${PWD##*/}/.vim/bundle/Command-T/ruby/command-t
if command -v ruby > /dev/null 2>&1; then
	ruby extconf.rb
	if command -v make > /dev/null 2>&1; then
		make
	fi
fi
