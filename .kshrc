#!/bin/ksh
# ~/.kshrc -- configuration for OpenBSD ksh(1), public domain Korn shell
#
# Author: Joel A. Hänel <joel@hanel.nu>, 2014-2018
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
if [ "$EDITOR" = "vim" ]; then
    set -o vi
elif [ "$EDITOR" = "vi" ]; then
    set -o vi
fi

# A short and informative prompt
PS1='\n$USER@$HOST:$PWD\n'"$PS1S"

# Just for fun...
if [ -z "$TERM" ]; then
    [ -x /usr/games/fortune ] \
        && echo "-------------------------------------------------------------------------------"; \
        echo; \
        /usr/games/fortune; \
        echo
    [ -d ~/.calendar ] \
        && echo "-------------------------------------------------------------------------------"; \
        echo; \
        /usr/bin/calendar; \
        echo
fi

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

#-------------------------------------------------------------------------------
# Functions
#-------------------------------------------------------------------------------

# (revision) control edit: Edit file and use RCS.
# arg: file
ce() {
    /usr/bin/co -l "$1"
    ${EDITOR} "$1"
    /usr/bin/ci -u "$1"
}

################################################################################
# Last updated: 2018-01-16 15:52:33 CET
