#!/usr/bin/bash

git --git-dir=$HOME/.dotfiles/.git -C $HOME/.dotfiles add -A
git --git-dir=$HOME/.dotfiles/.git -C $HOME/.dotfiles commit -m "Autopush $(date +%F)"
git --git-dir=$HOME/.dotfiles/.git -C $HOME/.dotfiles push
