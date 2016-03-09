# ~/.kshrc -- configuration for OpenBSD ksh(1), public domain Korn shell
#
# Copyright (c) 2004-2016, Joel A. Nilsson <joel@alikzus.se>
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

# Source a general config
if [ -f /etc/ksh.kshrc ]; then
    . /etc/ksh.kshrc    # OpenBSD default
elif [ -f $HOME/ksh.kshrc ]; then
    . $HOME/ksh.kshrc
fi

# vi mode if EDITOR is set to vim or vi
if [ "$EDITOR" = "vim" ]; then
    set -o vi
elif [ "$EDITOR" = "vi" ]; then
    set -o vi
fi

# A short and informative prompt
# Line breaks seems to only work with OpenBSD pdksh.
if [[ "$(uname)" = "OpenBSD" ]]; then
    PS1='\n$USER@$HOST:$PWD\n'"$PS1S"
else
    PS1='$USER@$HOST:$PWD'"$PS1S"
fi

[ -z "$TMUX" ] && export TERM=xterm-256color

# Show a fortune cookie, just for fun.
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
    /usr/bin/co -l $1
    ${EDITOR} $1
    /usr/bin/ci -u $1
}

# doas (revision) control edit: Edit file with doas and use RCS.
# arg: file
dce() {
    /usr/bin/doas /usr/bin/co -l $1
    /usr/bin/doas ${EDITOR} $1
    /usr/bin/doas /usr/bin/ci -u $1
}

# offsite messages: tail the messages log via ssh
# arg: host filter
om() {
    clear

    if [ -z $2 ]; then
        /usr/bin/ssh -t $1 'tail -f /var/log/messages'
    else
        /usr/bin/ssh -t $1 "tail -f /var/log/messages | grep -v $2"
    fi
}

################################################################################
# Last updated: 2016-03-08 07:24:38 CET
