#!/bin/bash

# MODE: workstation
# PLATEFORM: all
# PRIORITY:

# Installing package
pkg install tmux -y

# Creating symling to dotfile
ln -sf $HOME/.dotfiles/tmux/dotfile $HOME/.tmux.conf

# Creating os specific conf symlink
if [ "$PLATEFORM" == "mac" ]; then
    ln -sf $HOME/.dotfiles/tmux/tmux-mac.conf $HOME/.tmux-mac.conf
fi