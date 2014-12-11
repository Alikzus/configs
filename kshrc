# ~/.kshrc -- OpenBSD Korn shell configuration for interactive shells
# joel@alikzus.se, 2014-08-28.
# http://www.alikzus.se

. /etc/ksh.kshrc

# Turn on vi mode, it is awesome.
set -o vi

# A "short" but informative prompt.
# Line breaks seems to only work with OpenBSD pdksh.
if [[ "$(uname)" = "OpenBSD" ]]; then
    PS1='\n$USER@$HOST:$PWD\n'"$PS1S"
else
    PS1='$USER@$HOST:$PWD'"$PS1S"
fi

[ -z "$TMUX" ] && export TERM=xterm-256color

#if [ -z ${TMUX} ]; then
#  /usr/bin/tmux attach || /usr/bin/tmux
#fi

#--------------------------------------
# Aliases
#--------------------------------------

# Sudo and edit.
alias sv="sudo $EDITOR"

# Make a directory, with the parent flag -- DOS style.
alias md="mkdir -p"

# Remove an empty directory -- DOS style.
alias rd="rmdir"

# Clear the screen -- DOS style.
alias cls="clear"

# Switch user but keep your environment; supposed to be safer.
alias su="su -m"

# Edit the group file like the password file.
alias vigrp="vi /etc/group"

# List shortcuts.
alias ls="ls -F"
alias la="ls -A"
alias ll="ls -lo"
alias lal="ls -Alo"
alias lla="lal"

# Clear the screen before an exit.
alias exit="clear; exit"
