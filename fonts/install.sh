#!/bin/bash

# MODE: workstation
# PLATEFORM: mac
# PRIORITY:

# Installing Meslo
if [ ! -f ~/Library/Fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf ]; then
    cp  ./dotfiles/fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf ~/Library/Fonts/Meslo\ LG\ M\ Regular\ for\ Powerline.ttf
fi

# Installing Source Code Pro
if [ ! -f ~/Library/Fonts/Source\ Code\ Pro\ for\ Powerline.otf ]; then
    cp  ./dotfiles/fonts/Source\ Code\ Pro\ for\ Powerline.otf ~/Library/Fonts/Source\ Code\ Pro\ for\ Powerline.otf
fi
