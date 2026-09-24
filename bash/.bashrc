#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source aliases
source ~/.config/bash/aliases.sh

PS1='┌──\u@\h | \w\n└─≻ '
# ORIGINAL DEFAULT PS1
#PS1='[\u@\h \W]\$ '

# Load bash-completion
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# Initialize ble.sh
source -- ~/.local/share/blesh/ble.sh --attach=none

# Attach ble.sh
ble-attach

# source functions
for file in ~/.config/bash/functions/*.sh; do
    source "$file"
done
