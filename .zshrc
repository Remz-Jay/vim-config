# if ! [ "$TERM" = "xterm-kitty" ]; then 
#    export TERM="screen-256color";
# fi

export COLORTERM="truecolor"
export EDITOR='vim'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
#Prevent less from taking full screen when the content is less than a single page
export LESS="-F -X -R $LESS"

export GOPATH=$HOME/go
export NVM_DIR=$HOME/.nvm

export PATH=\
/usr/local/bin:\
/usr/local/sbin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/opt/puppetlabs/bin:\
$HOME/.rbenv/shims:\
$HOME/.rbenv/bin:\
/usr/local/opt/postgresql@9.4/bin:\
${GOPATH//://bin:}/bin:\
"/Applications/Visual Studio Code.app/Contents/Resources/app/bin":\
$HOME/bin:\
$PATH

eval "$(rbenv init -)"

# setopt complete_aliases
# autoload -Uz compinit
# autoload -Uz compdef
# compinit

# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.antigen/bundles/robbyrussell/oh-my-zsh
ZSH=$HOME/.oh-my-zsh

# zmodload zsh/zprof
# plugins=(brew composer forklift git git-extras github history history-substring-search jira node npm osx pow python rake symfony2 textmate tmux)
plugins=(git kubectl osx tmux vagrant docker bundler helm )

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# See: https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
if [ "$TERM" = "xterm-kitty" ]; then
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status kubecontext dir rbenv virtualenv vcs)
    POWERLEVEL9K_DISABLE_RPROMPT=true
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
    POWERLEVEL9K_OS_ICON_BACKGROUND="white"
    POWERLEVEL9K_OS_ICON_FOREGROUND="blue"
    POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
    POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
    POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
    POWERLEVEL9K_KUBECONTEXT_FOREGROUND="025"
    POWERLEVEL9K_KUBECONTEXT_BACKGROUND="253"
    POWERLEVEL9K_VCS_CLEAN_BACKGROUND='236'
    POWERLEVEL9K_VCS_CLEAN_FOREGROUND='083'
    POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='236'
    POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='005'
    POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='236'
    POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='003'
    POWERLEVEL9K_STATUS_OK_BACKGROUND='236'

else
    # POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(kubecontext dir rbenv virtualenv vcs)
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(kubecontext dir virtualenv vcs)
    POWERLEVEL9K_DISABLE_RPROMPT=true
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
    # POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history battery time os_icon);
    POWERLEVEL9K_COLOR_SCHEME='light';
    # POWERLEVEL9K_PROMPT_ON_NEWLINE=false
fi
# POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias dircolors='gdircolors'
alias mosh="mosh --server=\"LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/mosh-server\""
alias know="vim ~/.ssh/known_hosts"
alias hosts="sudo vim /etc/hosts"
alias psg="ps aux | grep -i "
alias vim="nvim"

# git aliases
alias gd="git diff --ws-error-highlight=new,old"
alias gpom="git push origin master"
alias gpull="git pull origin develop"
alias gpush="git push origin HEAD:refs/for/develop"
alias gs="git status"
alias noorig="find . -iname \"*.orig\" -delete"

# docker aliases
alias drmid='docker rmi $(docker images -f "dangling=true" -q)'
alias drma='docker rm $(docker ps -aq)'
alias dll='docker logs -f $(docker ps -q | head -1)'

# ls with color
alias ls='gls --color'

alias kctx=kubectx
alias kns=kubens

# recursive grep. Function, because I'm too lazy to type the closing dot.
function recgrep {
	grep -rin $1 .
}

# Execute bash inside docker container $1
function dbash {
	docker exec -it $1 /bin/bash;
}

# highlight
function show {
	grep --color -E "$1|$" $2
}

# Clean up known_hosts when a host key changed using this macro and reconnect.
function sssh() {
	ssh-keygen -R $1
	ssh-keyscan $1 >> ~/.ssh/known_hosts >/dev/null 2>&1
	ex +'g/^getaddr.*$/d' +'g/^#.*$/d' +'sort u' -cwq ~/.ssh/known_hosts
	ssh $1
}

# Add .bashrc and .vimrc to vagrant-ssh
function vs (){
	vagrant ssh $1 -- -At  "echo \"$(cat ~/vim-config/ssh-alias)\" > \$HOME/.bashrc; echo \"$(cat ~/vim-config/ssh-vimrc)\" > \$HOME/.vimrc; bash --rcfile \$HOME/.bashrc "
}
#compdef vs='vagrant ssh'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

#SH_FILE_EXPANSION="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(brew composer forklift git git-extras github history history-substring-search jira node npm osx pow python rake symfony2 textmate tmux)

source $ZSH/oh-my-zsh.sh

for method in GET HEAD POST PUT DELETE OPTIONS; do
	alias "$method"="lwp-request -m '$method'"
done

alias reload!='. ~/.zshrc'

expand-or-complete-with-dots() {
	echo -n "\e[31m......\e[0m"
	zle expand-or-complete
	zle redisplay
}

zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
bindkey "^[[1;2D" backward-word
bindkey "^[[1;2C" forward-word
# bindkey "${terminfo[khome]}" beginning-of-line
# bindkey "${terminfo[kend]}" end-of-line

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert

function fractal {
	local lines columns colour a b p q i pnew
	((columns=COLUMNS-1, lines=LINES-1, colour=0))
	for ((b=-1.5; b<=1.5; b+=3.0/lines)) do
		for ((a=-2.0; a<=1; a+=3.0/columns)) do
			for ((p=0.0, q=0.0, i=0; p*p+q*q < 4 && i < 32; i++)) do
				((pnew=p*p-q*q+a, q=2*p*q+b, p=pnew))
			done
			((colour=(i/4)%8))
			echo -n "\\e[4${colour}m "
		done
	echo
	done
}

if [ -e ~/.secrets ]; then
    source ~/.secrets
else
	print "ZSH/404: .secrets file not found."
fi

git-download(){
    folder=${@/tree\/master/trunk}
    folder=${folder/blob\/master/trunk}
    svn export $folder
}

eval $( dircolors -b $HOME/LS_COLORS )
source $HOME/vim-config/zsh-syntax-highlighting-filetypes.zsh

#if [ `uname` = Darwin ]; then
#	source $(brew --prefix nvm)/nvm.sh
#fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# source <(kubectl completion zsh)
source <(stern --completion=zsh)

# SSH host autocompletion
# local knownhosts
# knownhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )

# knownhosts=( ${${${${(f)"$(<$HOME/.nodes.txt)"}:#[0-9]*}%%\ *}%%,*} )
# zstyle ':completion:*:(ssh|scp|sftp):*' hosts $knownhosts
# zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
# compdef '_dispatch ssh ssh' s
compdef s=ssh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ssh-add -A &> /dev/null
# Automatically start a new tmux session if none are active.
# It would be wise to have iTerm2 keybindings set up if this line is active,
# because tabs in iTerm2 don't work as expected anymore.
if [[ -o login ]] && [ -t "$fd" ] && [ `uname` = Darwin ]; then
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	$HOME/tmux-launch.sh
else
	if [ "$TMUX" = "" ]; then tmux; fi
fi

# zprof
