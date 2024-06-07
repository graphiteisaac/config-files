set -x PATH $PATH /sbin/

# Starship prompt
starship init fish | source

# Zoxide (z) - better CD with memory
zoxide init fish | source


# Helpful aliases
alias cat="bat"
alias vim="nvim"
alias tmplclip="cat $1 | sed 's/{{/{ {/g' | xclip"

# TODO should really check if go, fnm, bun, etc are installed
# Programming tools
set BUN_INSTALL "$HOME/.bun"
set PATH /usr/local/go/bin $HOME/go/bin $BUN_INSTALL/bin $HOME/.zig $HOME/.local/share/fnm $PATH

# fnm
fnm env --use-on-cd | source

# bun completions
# [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
