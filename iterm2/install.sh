#!/bin/bash

# MODE: workstation
# PLATEFORM: mac
# PRIORITY :

# Installing iTerm2
pkg cask install iterm2

## Loading preferences from local folder
## http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/iterm2/preferences"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

## Loading profile from dynamic profiles folder
## https://iterm2.com/documentation-dynamic-profiles.html
mkdir -p $HOME/Library/Application\ Support/iTerm2/DynamicProfiles
ln -sf $HOME/.dotfiles/iterm2/profiles/solarized.json $HOME/Library/Application\ Support/iTerm2/DynamicProfiles/solarized.json