#!/bin/bash


# linkage
for f in .??*
do
    [ "$f" = ".git" ] && continue
    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

# macros
command_exists() {
    type "$1" &> /dev/null ;
}

# homebrew setup
if ! command_exists brew; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

