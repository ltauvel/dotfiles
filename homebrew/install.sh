#!/bin/bash

# MODE: workstation
# PLATEFORM: mac
# PRIORITY: 0

# Installing homebrew
if ! which brew; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi