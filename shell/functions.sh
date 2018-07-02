# Create a directory path and enter it
function mkcd(){
  mkdir -p $1
  cd $1
}

# Set theme
function settheme(){
  ln -sf $HOME/.dotfiles/shell/dircolors/solarized-$1.dircolors $HOME/.dircolors
  ln -sf $HOME/.dotfiles/tmux/themes/solarized-$1.tmux $HOME/.tmux-colors.conf
  ln -sf $HOME/.dotfiles/neovim/themes/solarized-$1.nvim $HOME/.vim-colors
  ln -sf $HOME/.dotfiles/oh-my-zsh/themes/solarized-$1.zsh $HOME/.zsh-colors

  if tmux info &> /dev/null; then
    # https://unix.stackexchange.com/questions/157911/whats-a-smart-way-to-use-maintain-two-separate-bash-profiles-and-vimrcs
    # https://stackoverflow.com/questions/8462114/change-vim-background-and-colorscheme-based-on-iterm-profile

    echo -e "\033Ptmux;\033\033]50;SetProfile=solarized-$1\007\033\\"
    tmux source-file ~/.tmux.conf
  else
    echo -e "\033]50;SetProfile=solarized-$1\a"
  fi

  exec "$SHELL" -l
}

# Loading other functions files
if [[ ! -z $(find $HOME -maxdepth 1 -name ".functions-*") ]]; then
  for file in $HOME/.functions-*; do
    source $file
  done
fi