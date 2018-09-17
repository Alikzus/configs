#!/bin/ksh
# ~/.kshrc -- configuration for OpenBSD ksh(1), public domain Korn shell
#
# Author: Joel A. Hänel <joel@hanel.nu>, 2014-2018
# Last updated: 2018-09-04 21:12:59 CEST
#

# Source a general config:
# /etc/ksh.kshrc is the OpenBSD default.
# Use the alternative on other systems.
# shellcheck disable=SC1091
# shellcheck disable=SC1090
if [ -f /etc/ksh.kshrc ]; then
    . /etc/ksh.kshrc
elif [ -f "$HOME/ksh.kshrc" ]; then
    . "$HOME/ksh.kshrc"
fi

# vi mode if EDITOR is set to vim or vi
if [ "$EDITOR" = "nvim" ]; then
    set -o vi
elif [ "$EDITOR" = "vim" ]; then
    set -o vi
elif [ "$EDITOR" = "vi" ]; then
    set -o vi
fi

# A short and informative prompt
PS1='\n$USER@$HOST:$PWD\n'"$PS1S"

#-------------------------------------------------------------------------------
# Aliases
#-------------------------------------------------------------------------------

# Keep a read-only copy when checking in a file with RCS
alias ci="ci -u"

# Clear the screen DOS style; bad muscle memory
alias cls="clear"

# Clear the screen before an exit
alias exit="clear; exit"

# List shortcuts
alias ls="ls -F"
alias la="ls -A"
alias ll="ls -lo"
alias lal="ls -Alo"
alias lla="lal"

# Keep environment when switching user.
# Supposed to be safer. True or not? Verify!
alias su="su -m"
