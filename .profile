#!/bin/sh
# ~/.profile -- profile for OpenBSD ksh(1), public domain Korn shell
#
# Author: Joel A. Nilsson <joel@alikzus.se>, 2014-2017
#

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

export PATH HOME TERM

if [ -x /usr/local/bin/vim ]; then
    export EDITOR=vim
else
    export EDITOR=vi
fi

export PAGER=less

export LC_CTYPE=sv_SE.UTF-8
export LC_MESSAGES=en_US.UTF-8

# The Haskell Cabal
if [ -d "$HOME/.cabal" ]; then
    PATH="$PATH:$HOME/.cabal/bin"
fi

# Go (golang)
if [ -d "$HOME/work" ]; then
    export GOPATH="$HOME/work"
    export PATH="$PATH:$GOPATH/bin"
fi

# Export the environment if the shell is interactive.
export ENV=$HOME/.kshrc

#-------------------------------------------------------------------------------
# Last updated: 2017-08-13 19:03:06 CEST
