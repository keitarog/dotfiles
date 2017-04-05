#!/bin/bash

if ! command_exists brew; then
	write_log "Installing Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! command_exists git; then
	write_log "Installing Git"
	brew install git
fi

if ! command_exists mvim; then
	write_log "Installing MacVim"
	brew install macvim
fi

if [ ! -d ~/.vim/plugged ]; then
	write_log "Installing Vim-Plug"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

