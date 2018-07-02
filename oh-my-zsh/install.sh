#!/bin/bash

# MODE: workstation
# PLATEFORM: all
# PRIORITY: 2

# Installing oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

ln -sf $HOME/.dotfiles/oh-my-zsh/themes/agnoster-light.zsh-theme $HOME/.oh-my-zsh/themes/agnoster-light.zsh-theme