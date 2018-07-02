#!/bin/bash

# Get current file path
if uname | grep -iq 'darwin'; then
  BASE_DIR=$(cd $(dirname $(stat -f ${BASH_SOURCE:-$0})); PWD)
else
  BASE_DIR=$(dirname $(readlink -f ${BASH_SOURCE:-$0}))
fi

# Loading functions
source $BASE_DIR/functions.sh

# Loading plateform
PLATEFORM=$(get_plateform)

# Checking if .dotfiles folder exists in user home
if [ ! -d $HOME/.dotfiles ]; then
  ln -sf $BASE_DIR $HOME/.dotfiles
fi

# Launch all modules setups
for file in $(get_modules_setup); do
  printf "\033[33m==> ${file}\033[0m\n"
  source $file
  echo
done

# Reloading
source $HOME/.aliases
source $HOME/.functions
settheme dark