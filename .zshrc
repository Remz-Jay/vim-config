# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew composer forklift git git-extras github history history-substring-search jira node npm osx pow python rake symfony2 textmate tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=\
/usr/local/bin:\
/usr/local/sbin:\
/Users/remco/.rvm/gems/ruby-1.9.3-p362/bin:\
/Users/remco/.rvm/gems/ruby-1.9.3-p362@global/bin:\
/Users/remco/.rvm/rubies/ruby-1.9.3-p362/bin:\
/Users/remco/.rvm/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/opt/X11/bin:\
$PATH

function powerline_precmd() {
	export PS1="$(~/powerline-shell.py $? --shell zsh)"
}

function install_powerline_precmd() {
	for s in "${precmd_functions[@]}"; do
  	if [ "$s" = "powerline_precmd" ]; then
    	return
    fi
	done
	precmd_functions+=(powerline_precmd)
}

install_powerline_precmd
if [[ -r ~/.credentials ]]; then
	source ~/.credentials
fi

if [ "$TMUX" = "" ]; then tmux; fi
