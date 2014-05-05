#!/usr/bin/env bash

# cd "$(dirname "${BASH_SOURCE}")"
#git pull origin master
# $(grep  -lib "# dotfile:" --exclude $(basename $0) *)

function copyFiles() {

	filelist=$(find . -maxdepth 1 ! -name "." ! -name ".git" ! -name "Brewfile" ! -name Caskfile ! -name "*.md" ! -name $(basename $0))

	for f in ${filelist}
	do
 		echo "Processing: $f"
 		file=$(basename $f)
 		rsync  -q -av --no-perms ${f} ~
	done
}


if [ "$1" == "--overwrite" -o "$1" == "-o" ]; then
	copyFiles
elif [ "$1" == "--update" -o "$1" == "-u" ]; then
    git pull origin master
else 
	echo "This may overwrite existing files in your home directory."
	read -p "Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		copyFiles
	fi
fi


