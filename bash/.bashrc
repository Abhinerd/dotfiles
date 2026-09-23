#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias eza-tree='eza -A --icons=always --tree -I ".git"'
alias eza='eza -a -1 --icons=always'

PS1='\n┌──{\u@\h} [\w]\n└─ $ '
# ORIGINAL DEFAULT PS1
#PS1='[\u@\h \W]\$ '

# Initialize ble.sh
source -- ~/.local/share/blesh/ble.sh --attach=none

# Attach ble.sh
ble-attach
