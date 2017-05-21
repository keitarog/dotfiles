
ALINE="source ~/.dotfiles/etc/macos/.bash_profile"
AFILE="~/.bash_profile"

grep -qF "$ALINE" $AFILE || echo "$ALINE" >> $AFILE

