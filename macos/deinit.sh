
# unlinkage
for f in .??*
do
    [ "$f" = ".git" ] && continue
		if [ -L "$HOME/$f" ]; then
			rm -f "$HOME/$f"
		fi
done

rm -rf ~/.dotfiles

