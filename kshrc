# ~/.kshrc -- configuration for OpenBSD ksh(1), public domain Korn shell
#
# Copyright (c) 2004-2015, Joel A. Nilsson <joel@alikzus.se>
# 
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#

# Source "global" config
if [ -f /etc/ksh.kshrc ]; then
    . /etc/ksh.kshrc
elif [ -f $HOME/ksh.kshrc ]; then
    . $HOME/ksh.kshrc
fi

# vi mode if EDITOR is set to vim or vi
if [ "$EDITOR" = "vim" ]; then
    set -o vi
elif [ "$EDITOR" = "vi" ]; then
    set -o vi
fi

# A "short" but informative prompt.
# Line breaks seems to only work with OpenBSD pdksh.
if [[ "$(uname)" = "OpenBSD" ]]; then
    PS1='\n$USER@$HOST:$PWD\n'"$PS1S"
else
    PS1='$USER@$HOST:$PWD'"$PS1S"
fi

[ -z "$TMUX" ] && export TERM=xterm-256color

#-------------------------------------------------------------------------------
# Aliases
#-------------------------------------------------------------------------------

# Help with the transition from sudo(8) to doas(1)
if [ ! -x /usr/bin/doas ]; then
    alias doas="sudo"
else
    alias sudo="doas"
fi

# Make a directory, with the parent flag -- DOS style
alias md="mkdir -p"

# Remove an empty directory -- DOS style
alias rd="rmdir"

# Clear the screen -- DOS style
alias cls="clear"

# Switch user but keep your environment; supposed to be safer
alias su="su -m"

# Edit the group file like the password file
alias vigrp="vi /etc/group"

# List shortcuts
alias ls="ls -F"
alias la="ls -A"
alias ll="ls -lo"
alias lal="ls -Alo"
alias lla="lal"

# Clear the screen before an exit.
alias exit="clear; exit"

#-------------------------------------------------------------------------------
# Last updated: 2015-08-23 13:20:41 CEST
