set -x PATH $PATH /sbin/

# Starship prompt
starship init fish | source

# Zoxide (z) - better CD with memory
zoxide init fish | source


# Helpful aliases
alias cat="bat"
alias vim="nvim"
alias tmplclip="cat $1 | sed 's/{{/{ {/g' | xclip"

abbr --add gst 'git status'
abbr --add gcmsg 'git commit -m '
abbr --add gaa 'git add --all'
abbr --add ggp 'git push'
abbr --add gm 'git merge'
abbr --add gi 'git init'
abbr --add gl 'git log'
abbr --add gcob 'git checkout -b'

function git_abbr_uninstall --on-event git_abbr_uninstall
    abbr -e gst
    abbr -e gcmsg
    abbr -e gaa
    abbr -e ggp
    abbr -e gm
    abbr -e gi
    abbr -e gl
    abbr -e gcob
end

# TODO should really check if go, fnm, bun, etc are installed
# Programming tools
set BUN_INSTALL "$HOME/.bun"
set DENO_INSTALL "$HOME/.deno"
set PATH /usr/local/go/bin $HOME/go/bin $BUN_INSTALL/bin $HOME/.zig $HOME/.local/share/fnm $PATH $DENO_INSTALL/bin

# fnm
fnm env --use-on-cd | source

# asdf
source ~/.asdf/asdf.fish

# bun completions
# [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
