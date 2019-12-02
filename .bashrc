export EDITOR='vim'
export BYOBU_PREFIX=`brew --prefix`

#[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#function _update_ps1() {
#   export PS1="$(~/powerline-shell.py $?)"
#}

#alias tmux="TERM=screen-256color-bce tmux"

if [[ -r ~/.credentials ]]; then
    source ~/.credentials
fi

if [[ -r ~/.secrets ]]; then
	source ~/.secrets
fi

# export PROMPT_COMMAND="_update_ps1"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
