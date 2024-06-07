# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

#
# oh-my-zsh Config
# 
ZSH_THEME="agnoster"
plugins=(git zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

#
# User configuration
#

# Zoxide
eval "$(zoxide init zsh)"

# Starship
# eval "$(starship init zsh)"

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# mkcd command - saves a little time!
function mkcd {
    if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

# alias vim to nvim and cat to the superior bat 
alias cat="bat"
alias vim="nvim"
alias tmplclip="cat $1 | sed 's/{{/{ {/g' | xclip"

# enable fzf for wicked fast file fuzzy finding
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TODO should really check if go, fnm, bun, etc are installed
# Programming tools
export PATH=$PATH:/usr/local/go/bin # Golang 
export PATH=$PATH:/$HOME/go/bin # Golang 

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.zig:$PATH"
