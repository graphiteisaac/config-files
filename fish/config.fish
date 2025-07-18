set -x PATH $PATH /sbin/

# Starship prompt
starship init fish | source

# Zoxide (z) - better CD with memory
zoxide init fish | source


# Helpful aliases
alias cat="bat"
alias vim="nvim"
alias tmplclip="cat $1 | sed 's/{{/{ {/g' | xclip -sel c"

function dsi
    wget -q -O - "https://hub.docker.com/v2/namespaces/library/repositories/$argv/tags?page_size=100" | grep -o '"name": *"[^"]*' | grep -o '[^"]*$' | sort
end

abbr --add gst 'git status'
abbr --add gcmsg 'git commit -m '
abbr --add gaa 'git add --all'
abbr --add ggp 'git push'
abbr --add gm 'git merge'
abbr --add gi 'git init'
abbr --add gl 'git log'
abbr --add gcob 'git checkout -b'
abbr --add mv 'mv -vn'
abbr --add gfmt 'gleam format'
abbr --add yoshitime 'gleam update'

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

# TODO: should really check if go, fnm, bun, etc are installed
# Programming tools
set BUN_INSTALL "$HOME/.bun"
set DENO_INSTALL "$HOME/.deno"
set PATH /usr/local/go/bin $HOME/go/bin $BUN_INSTALL/bin $HOME/.zig $HOME/.local/share/fnm $PATH $DENO_INSTALL/bin $HOME/.cache/rebar3/bin
fish_add_path $HOME/.composer/vendor/bin /opt/nvim-linux-x86_64/bin 
set -g fish_user_paths /home/isaac/.local/share/ponyup/bin $fish_user_paths

# fnm
fnm env --use-on-cd | source

# asdf
source ~/.asdf/asdf.fish

# bun completions
# [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun

# dune
set --export PATH /home/soox/.dune/bin $PATH


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/isaac/.opam/opam-init/init.fish' && source '/home/isaac/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
