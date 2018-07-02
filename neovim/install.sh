#!/bin/bash

# MODE: workstation
# PLATEFORM: all
# PRIORITY:

# Installing package
pkg install neovim -y

# Installing vim-plug
# https://github.com/junegunn/vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Creating symling to dotfile
# https://gist.github.com/subfuzion/7d00a6c919eeffaf6d3dbf9a4eb11d64
mkdir -p $HOME/.config/nvim
ln -sf $HOME/.dotfiles/neovim/dotfile $HOME/.config/nvim/init.vim

# Installing plugins
nvim +silent +PlugInstall +qall
