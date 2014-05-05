# Add `~/bin` to the `$PATH`
# dotfile: destination=~/.bash_profile

export PATH="$HOME/bin:$PATH"

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

alias l='ls -lisa'

