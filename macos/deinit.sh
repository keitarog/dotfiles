#!/bin/bash

# deinit.sh

. common.sh

# unlinkage
for f in .??*
do
	[ "$f" = ".git" ] && continue
	[ "$f" = ".gitignore" ] && continue	
	if [ -L "$HOME/$f" ]; then
		rm -f "$HOME/$f"
	fi
done

rm -rf ~/.dotfiles

