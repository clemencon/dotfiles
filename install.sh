#!/bin/bash

# The full path to the dotfiles directory.
DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

mkdir -p $HOME/.local/bin

rm $HOME/.tmux.conf
ln -s $DOTFILES/tmux/tmux.conf $HOME/.tmux.conf

# Todo: Check out this t script.
# rm $HOME/.local/bin/t
# ln -s $DOTFILES/scripts/t $HOME/.local/bin/t

rm -rf $HOME/.config/nvim
ln -s $DOTFILES/nvim $HOME/.config/nvim

