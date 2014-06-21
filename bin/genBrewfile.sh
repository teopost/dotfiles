#!/bin/sh

export bFile=~/.dotfiles/Brewfile
export brewlist=$(brew leaves | sed 's/^/install /')

echo "
# Install command-line tools using Homebrew
# Usage: brew bundle Brewfile

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install brew packages

$brewlist

# Remove outdated versions from the cellar
cleanup

" > $bFile
echo "Brewfile created"
