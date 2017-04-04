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
mv -f dotfiles-master "$DOTPATH"

# cd to dotpath
cd $DOTPATH
if [ $? -ne 0 ]; then
	die "not found: $DOTPATH"
fi

# linkage
for f in .??*
do
    [ "$f" = ".git" ] && continue
    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

