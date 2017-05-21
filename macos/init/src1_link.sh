
LINE="source ~/.dotfiles/etc/macos/.bash_profile"
FILE="~/.bash_profile"

grep -qF "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

