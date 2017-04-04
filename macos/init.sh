#!/bin/bash

DOTPATH=~/.dotfiles

# linkage
for f in .??*
do
    [ "$f" = ".git" ] && continue
    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

bash i0_brew.sh

