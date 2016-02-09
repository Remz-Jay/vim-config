vim-config
==========

My personal "Text Triumvirate" configuration as defined in this [Dr.Bunsen](http://www.drbunsen.org/the-text-triumvirate/) article.

It consists out of:
* A `.vimrc` with all required [Pathogen](https://github.com/tpope/vim-pathogen) modules. 
* A `.zshrc` for use with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).
* A `.tmux.conf` for use with tmux

The entire setup is primarily meant for use with Mac OS X, but is set up to be generic, so it might benefit others as well.

An install script that generates the required symlinks and binaries is provided
for linux based systems. (Which may or may not work in your situation.)

## Prerequisites
* You have `zsh` installed
* You have `tmux` installed (`2.1`+ or you will have issues with the supplied
		`.tmux.conf` )
* You have `vim` installed and compiled with `ruby` and `python` support
* You have `ruby`, `ruby-devel`, `python` and `python-pip` installed
* You have `powerline` installed from either Git or `pip`. (See: 
		https://powerline.readthedocs.org/en/latest/installation.html )
* `Exuberant Ctags`, as TagBar will not work with GNU ctags. On OSX: `brew install ctags`
* You have `UTF-8` locales installed, otherwise the `tmux` powerline setup will
fail.

For a clean CentOS7 installation, this would fix all of your prerequisites:
```
sudo yum install -y zsh wget vim ruby ruby-devel python ctags git
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py
sudo pip install powerline-status
sudo yum install -y libevent-devel ncurses ncurses-devel
wget https://github.com/tmux/tmux/releases/download/2.1/tmux-2.1.tar.gz
tar xzvf tmux-2.1.tar.gz
cd tmux-2.1
./configure
make
sudo make install
sudo localedef -c -f UTF-8 -i en_US en_US.UTF-8
export LC_ALL=en_US.UTF-8
```

## Installation
Installation on any Linux or OSX machine is pretty straightforward:

```
cd ~
git clone https://github.com/Remz-Jay/vim-config.git
cd vim-config
./linux-bootstrap.sh
```

Then change your shell to `zsh` if you haven't done already and log in again.
```
[vagrant@puppet vim-config]$ chsh
Changing shell for vagrant.
New shell [/bin/bash]: /bin/zsh
Password:
Shell changed.
[vagrant@puppet vim-config]$ logout
```

Fix configuration in `.zshrc` and other files immediately after installation to
match your situation; It's highly unlikely that your setup will work 100% OK
unless your username is `remco` and your `$PATH` matches mine.

This installer will also install `powerline-shell` and `oh-my-zsh` for you if they
do not already exist.

On OSX you will also need a patched font for powerline to work right. The
required patched fonts are conveniently cloned along with this repository.
See the [font-installation manual for
powerline](https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation) for further instructions.

## Troubleshooting
It might be the case that the `Command-T` vim plugin causes a segfault on your system when you use the bootstrap script.
This is due to the fact that it was compiled for a different architecture than your vim.
See the [Command-T manual](http://git.wincent.com/command-t.git/blob_plain/HEAD:/doc/command-t.txt) for instructions.

Specifically:

````
 First you have to check the platform Vim was built for:

  vim --version
  ...
  Compilation: gcc ... -arch i386 ...
  ...

and make sure you use the correct ARCHFLAGS during compilation:

  export ARCHFLAGS="-arch i386"
  make
````
It also might be the case that powerline won't work in vim, showing:
````
An error occured while importing the Powerline package. This could be caused by an invalid sys.path setting, or by an incompatible Python version (Powerline requires Python 2.7 or 3.3+ to work). Please consult the troubleshooting section in the documentation for possible solutions.
````
In which case you'll have to run:
````
pip install --user -U git+git://github.com/Lokaltog/powerline
````

## Credits 

The entire setup is based on Michiel Roos' configuration. You can say thanks at [@TuurlijkNiet][1]

[1]: https://twitter.com/TuurlijkNiet       "Twitter"

