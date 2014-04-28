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

# export PROMPT_COMMAND="_update_ps1"
