#!/bin/bash

DOTPATH=~/.dotfiles
GITHUB_URL="https://github.com/keitarog/dotfiles/archive/master.tar.gz"

# dowload and extract tarball
curl -L $GITHUB_URL | tar xv -

echo '
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝'

if [ -d "$DOTPATH" ]; then
	echo "NOTICE: ~/.dotfiles directory already exists"
	echo "Do you want to overwrite them? (Y/n)"
	read INPUT
	if [ "$INPUT" = "Y" ]; then
		(cd "$DOTPATH" && make uninstall)
	else
		echo "User interrupted"
		exit
	fi
fi

mv -f dotfiles-master "$DOTPATH"

# cd to dotpath
cd $DOTPATH
if [ $? -ne 0 ]; then
	echo "ERROR: $DOTPATH not found"
	exit
fi

make install

