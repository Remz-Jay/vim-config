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
* You have `tmux` installed
* You have `vim` installed and compiled with `ruby` and `python` support
* You have both `ruby` and `python` installed
* `Exuberant Ctags`, as TagBar will not work with GNU ctags. On OSX: `brew install ctags`


## Installation
Installation on any Linux or OSX machine is pretty straightforward:

```
cd ~
git clone https://github.com/Remz-Jay/vim-config.git
cd vim-config
./linux-bootstrap.sh
```

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

