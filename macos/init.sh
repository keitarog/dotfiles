#!/bin/bash

DOTPATH=~/.dotfiles

# error handling: stops on error
trap 'echo ERROR: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# includes common utility functions
. script/common.sh

# declared at common.sh
detect_os PLATFORM

# linkage
for f in .??*
do
	[ "$f" = ".git" ] && continue
	[ "$f" = ".gitignore" ] && continue
	ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

. $(PLATFORM)/init/*.sh

write_log "Initialization complete"

