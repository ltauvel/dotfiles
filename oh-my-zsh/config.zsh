#!/bin/zsh

# Shortcut to this dotfiles path is $ZSH
export ZSH=$HOME/.oh-my-zsh

# Loading theme
source $HOME/.zsh-colors

# Registering plugins
plugins=(rust k git sudo tmux tmuxinator ruby gem aws bower bundler brew-cask brew coffee docker git-extras lein node npm osx pip python terraform scala sbt z docker-compose gradle mvn ng pass perl tig)

source $ZSH/oh-my-zsh.sh