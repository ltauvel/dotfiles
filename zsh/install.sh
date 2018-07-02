#!/bin/bash

# MODE: workstation
# PLATEFORM: all
# PRIORITY: 2

# Installing zsh
pkg install zsh -y

# Creating symling to dotfile
ln -sf $HOME/.dotfiles/zsh/dotfile $HOME/.zshrc

# Changing default shell for current user
if [ "$PLATEFORM" == "mac" ]; then
  if ! dscl . -read /Users/$USER UserShell | egrep -q ".+/zsh"; then
    chsh -s /bin/zsh
  fi
elif ! cat /etc/passwd | egrep -q ":$(id -u):.+/zsh"; then
  chsh -s /bin/zsh
fi