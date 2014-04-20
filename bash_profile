# Add `~/bin` to the `$PATH`
# dotfile: destination=~/.bash_profile

export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if [ -f ~/.bash_profile_extras ]
then
    source ~/.bash_profile_extras
fi
