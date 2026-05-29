#!/usr/bin/env sh

stow -R . 2>/dev/null

# -- Apply symlinks from .scripts/utils -> .local/bin -- 

# automatically
stow -R --target=$HOME/.local/bin/ --dir=$HOME/.dotfiles/.scripts/utils/ . --ignore=sshfs-pb111.sh 2>/dev/null

# renamed
ln -s $HOME/.scripts/utils/sshfs-pb111.sh $HOME/.local/bin/pb111 2>/dev/null
