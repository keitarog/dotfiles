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

echo $PLATFORM/init/*.sh

for f in $PLATFORM/init/*.sh
do
  echo $f
  bash "$f"
done

write_log "Initialization complete"

