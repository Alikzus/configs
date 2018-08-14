#!/bin/sh
#
# ~/.profile -- profile for OpenBSD ksh(1), public domain Korn shell
#
# Author: Joel A. Hänel <joel@hanel.nu>, 2014-2018
#

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

export PATH HOME TERM

if [ -x /usr/local/bin/nvim ]; then
    export EDITOR=nvim
elif [ -x /usr/local/bin/vim ]; then
    export EDITOR=vim
else
    export EDITOR=vi
fi

export PAGER=less

export PRINTER=rp

export LC_CTYPE=sv_SE.UTF-8
export LC_MESSAGES=en_US.UTF-8

export XDG_CONFIG_HOME=$HOME/etc
export XDG_DATA_HOME=$HOME/share

# Go (golang)
if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
    export PATH="$PATH:$GOPATH/bin"
fi

# Export the environment if the shell is interactive.
export ENV=$HOME/.kshrc

#-------------------------------------------------------------------------------
# Last updated: 2018-08-14 19:48:35 CEST
