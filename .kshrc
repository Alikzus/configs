# ~/.kshrc -- configuration for OpenBSD ksh(1), public domain Korn shell
#
# Author: Joel A. Nilsson <joel@alikzus.se>, 2014-2016
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
# Last updated: 2016-09-10 17:18:37 CEST
