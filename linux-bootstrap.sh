#!/bin/bash

# Take home dir as parameter for use in puppet script
if [[ -z $1 ]]
then
	home=~
else
	home=$1
fi
#Install prerequisites
if [ ! -d $home/.oh-my-zsh ]
then
	curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

# Create symlinks
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
if [ -e $home/tmux-launch.sh ] || [ -L $home/tmux-launch.sh ]
then
	mv $home/tmux-launch.sh $home/tmux-launch.sh.original
fi
if [ -e $home/.config/powerline ] || [ -L $home/.config/powerline ]
then
	mv $home/.config/powerline $home/.config/powerline.original
fi

mkdir -p $home/.config
ln -s $home/${PWD##*/}/.tmux.conf $home/.tmux.conf
ln -s $home/${PWD##*/}/.bashrc $home/.bashrc
ln -s $home/${PWD##*/}/.zshrc $home/.zshrc
ln -s $home/${PWD##*/}/powerline-config $home/.config/powerline
ln -s $home/${PWD##*/}/tmux-launch.sh $home/tmux-launch.sh
ln -s $home/${PWD##*/}/.powerline-shell.json $home/.powerline-shell.json
chmod u+x $home/tmux-launch.sh

# Initialize submodules
git submodule update --init --recursive

# Install nvim stuff
pip2 install --upgrade neovim
pip3 install --upgrade neovim
npm install -g neovim
gem install neovim

