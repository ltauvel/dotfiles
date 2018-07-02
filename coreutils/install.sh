#!/bin/bash

# MODE: workstation
# PLATEFORM: mac
# PRIORITY : 2

# Installing git
pkg install coreutils -y
pkg install wget -y

# Creating symbolic links to global mac shell conf
ln -sf $HOME/.dotfiles/coreutils/aliases-mac.sh $HOME/.aliases-mac