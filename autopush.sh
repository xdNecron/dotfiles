#!/usr/bin/bash

DATE='%(%Y-%m-%d)T'

git --git-dir=$HOME/.dotfiles/.git -C $HOME/.dotfiles add -A
git --git-dir=$HOME/.dotfiles/.git -C $HOME/.dotfiles commit -m "Autopush $DATE"
git --git-dir=$HOME/.dotfiles/.git -C $HOME/.dotfiles push
