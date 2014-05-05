#!/usr/bin/env bash

# cd "$(dirname "${BASH_SOURCE}")"
#git pull origin master
# $(grep  -lib "# dotfile:" --exclude $(basename $0) *)

function copyFiles() {

	filelist=$(find . -maxdepth 1 ! -name "." ! -name ".git" ! -name "Brewfile" ! -name Caskfile ! -name "*.md" ! -name $(basename $0))
    mydir=$(pwd)
    # $(grep  -lib "# dotfile:" --exclude $(basename $0) *)

	for f in ${filelist}
	do
 		echo "Processing: $mydir / $f"
 		file=$(basename $f)
 		# cp  ${mydir}/${file} ~/.${file}
 		rsync  -av --no-perms ${mydir}/${file} ~/${file}
 		# do something on $f
	done

#	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh"  --exclude "README.md"  -av --no-perms . ~
#	source ~/.bash_profile
}


if [ "$1" == "--overwrite" -o "$1" == "-o" ]; then
	copyFiles
elif [ "$1" == "--update" -o "$1" == "-u" ]; then
    git pull origin master
else 
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		copyFiles
	fi
fi


