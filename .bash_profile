# Some good sources
# http://natelandau.com/my-mac-osx-bash_profile/


# Add `~/bin` to the `$PATH`
# dotfile: destination=~/.bash_profile

export PATH="$HOME/bin:$PATH"

# Set terminal colours
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Increase history 
export HISTFILESIZE=5000

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

alias l='ls -lisa'
alias iorder='cd /Users/teopost/Documents/Work/iOrder'

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

