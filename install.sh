#!/bin/bash

DOTPATH=~/.dotfiles
GITHUB_URL="https://github.com/keitarog/dotfiles/archive/master.tar.gz"

echo '
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝'
                                                             


# dowload and extract tarball
curl -L $GITHUB_URL | tar xv -

if [ -d "$DOTPATH" ]; then
	echo "ERROR: ~/.dotfiles directory already exists"
	exit
fi

mv -f dotfiles-master "$DOTPATH"

# cd to dotpath
cd $DOTPATH
if [ $? -ne 0 ]; then
	echo "ERROR: $DOTPATH not found"
	exit
fi

export DOTPATH
make install

