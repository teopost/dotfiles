# ------------------------------------------------------------------------------
# Default Development Directory
# ------------------------------------------------------------------------------
# Add ./bin to path
if [ -d "$HOME/bin" ]; then
  export PATH="$HOME/bin:$PATH"
  export PATH="/usr/local/bin:$PATH"
fi

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

function weeknumber {
 /bin/date +%V
}

# ------------------------------------------------------------------------------
# Add a new line on every prompt
# ------------------------------------------------------------------------------
function __ps1_newline_login {
    if [[ -n "${PS1_NEWLINE_LOGIN:-}" ]]; then
        echo
    else
        PS1_NEWLINE_LOGIN=true
    fi
}

#PROMPT_COMMAND="${PROMPT_COMMAND} && __ps1_newline_login"

# ------------------------------------------------------------------------------
# Add git branch info on every prompt inside git repository folder
# ------------------------------------------------------------------------------
export GIT_PS1_SHOWDIRTYSTATE=true `# show unstaged (*) and staged (+) changes`

# ------------------------------------------------------------------------------
# Add colors to my prompt
# ------------------------------------------------------------------------------
#export PS1="\h:\W \u\$ "
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
#PS1="  \h:\W \u\$(__git_ps1 \" (%s) \")\$ "

#PS1="\[\e[32m\]➜ \$ \W \u\$(__git_ps1 \" (%s) \")\$ "

#PS1="\[\e[32m\]➜ \$ \[\e[34m\]\W:\[\e[31m\]\$(__git_ps1 \" (%s)\")\[\e[0m\]  "

PS1="\[\e[32m\]➜  \[\e[34m\]\W:\[\e[31m\]\$(__git_ps1 \" (%s)\")\[\e[0m\]  "


# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

# Preview manpages in pdf format
pman() {
    man -t ${@} | open -f -a /Applications/Preview.app/
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
    echo "wan: " $(curl -s ipinfo.io/ip)
    echo "lan: " $(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d " " -f2)
}

# ------------------------------------------------------------------------------
# Open the Finder directory in the terminal
# ------------------------------------------------------------------------------
function cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}

# ------------------------------------------------------------------------------
# Alias
# ------------------------------------------------------------------------------
alias l='ls -lisa'
alias flushdns='sudo killall -HUP mDNSResponder'
alias iorder='cd /Users/teopost/Documents/Work/iOrder'
alias spider='wget --force-directories --recursive --no-parent --no-clobber --convert-links --adjust-extension'

# Aggiungo le variabili d'ambiente di Oracle
source ~/oracle/bash_profile
