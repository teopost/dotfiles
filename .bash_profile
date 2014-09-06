# ------------------------------------------------------------------------------
# Default Development Directory
# ------------------------------------------------------------------------------
# Add ./bin to path
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
fi

export PATH="/usr/local/bin:$PATH"

# Set terminal colours
export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:"
export GREP_OPTIONS='--color=auto'


# ------------------------------------------------------------------------------
# Better Bash
# ------------------------------------------------------------------------------
export HISTSIZE=100000
export HISTCONTROL=ignoreboth:erasedups
# # (Ref.: http://www.talug.org/events/20030709/cmdline_history.html)
# export HISTIGNORE="&:ls:[bf]g:exit"

# Don't tab-complete if prompt is empty
shopt -s no_empty_cmd_completion

# History completion to what's already on the line
# (Ref.: http://stackoverflow.com/a/1030206/11895)
#bind '"\e[A": history-search-backward'
#bind '"\e[B": history-search-forward'

# ------------------------------------------------------------------------------
# See "brew info bash-completion"
# ------------------------------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# ------------------------------------------------------------------------------
# Pimp my prompt
# ------------------------------------------------------------------------------
function __ps1_newline_login {
    if [[ -n "${PS1_NEWLINE_LOGIN:-}" ]]; then
        echo 
    else
        PS1_NEWLINE_LOGIN=true
    fi
}

PROMPT_COMMAND="${PROMPT_COMMAND}__ps1_newline_login;"

export GIT_PS1_SHOWDIRTYSTATE=true `# show unstaged (*) and staged (+) changes`

# export PS1="\h:\W \u\$ "
export PS1="\[\e[32m\]➜  \[\e[34m\]\W:\[\e[31m\]\$(__git_ps1 \" (%s)\")\[\e[0m\]  "


# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

# Preview manpages in pdf format
pman() {
    man -t ${@} | open -f -a /Applications/Preview.app/
}

# Internet search form comand-line
function google {
    local search=""
    for term in "$@"; do
        if [[ -z "${search:-}" ]]; then
            search="$term"
        else
            search="$search%20$term"
        fi
    done
    if [[ -z "${search:-}" ]]; then
        echo 'Usage: google something' >&2
        return 1
    else
        open "http://www.google.com/?q=$search";
    fi
}

function serve {
    python -m SimpleHTTPServer "${1:-8080}"
}

function push-iorder-wiki() {
    git add .
    git commit -a -m "$1"
    git push foobar gh-pages
}

function lazygit() {
    git add .
    git commit -a -m "$1"
    git push
}

function myip() {
    echo "wan: " $(curl -s ip.appspot.com)
    echo "lan: " $(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d " " -f2)
}

# ------------------------------------------------------------------------------
# Alias
# ------------------------------------------------------------------------------
alias l='ls -lisa'
alias iorder='cd /Users/teopost/Documents/Work/iOrder'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
