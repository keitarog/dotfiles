

# homebrew setup
# macros
command_exists() {
    type "$1" &> /dev/null ;
}

if ! command_exists brew; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! command_exists git; then
	brew install git
fi

if ! command_exists mvim; then
	brew install macvim
	if [ ! -d ~/.vim/plugged ]; then
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	fi
fi

