# Teopost's dotfiles

## Installation

### Using Git and the bootstrap script

Clone the repository in `~/.dotfiles`. Launch the bootstrapper script copy the files to your home folder.

```bash
git clone https://github.com/teopost/dotfiles.git .dotfiles && cd .dotfiles && ./bootstrap.sh
```

To copy dotfiles from repository to home directory, `cd` into your local `.dotfiles` repository and then:
(The swich -f force overwrite dotfiles)

```bash
./bootstrap.sh -f
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
./bootstrap.sh
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
brew bundle ~/.dotfiles/Brewfile
```

### Install apps with `brew cask`

You could also install native apps with [`brew cask`](https://github.com/phinze/homebrew-cask):

```bash
brew bundle ~/.dotfiles/Caskfile
```

## Feedback

Suggestions/improvements
[welcome](https://github.com/teopost/dotfiles/issues)!

