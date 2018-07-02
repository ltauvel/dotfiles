## reload all
alias reload!='exec "$SHELL" -l'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# clear your terminal
alias c='clear'

# directory listing
alias ll='ls -la'

## make you look all busy and fancy in the eyes of non-technical people.
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""

# Force redirecting vi and vim to nvim
alias vi="nvim"
alias vim="nvim"

# Loading other aliases files
if [[ ! -z $(find $HOME -maxdepth 1 -name ".aliases-*") ]]; then
  for file in $HOME/.aliases-*; do
    source $file
  done
fi