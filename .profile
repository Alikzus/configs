#!/bin/sh
#
# ~/.profile -- profile for OpenBSD ksh(1), public domain Korn shell
#
# Author: Joel A. Hänel <joel@hanel.nu>, 2014-2018
# Last updated: 2018-09-04 21:14:00 CEST
#

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

EDITOR="vi"
[ -x /usr/local/bin/vim ]  && EDITOR="vim"
[ -x /usr/local/bin/nvim ] && EDITOR="nvim"

PAGER="less"

export MPD_HOST="mpd"
export PRINTER="rp"

export XDG_CONFIG_HOME="$HOME/etc"
export XDG_DATA_HOME="$HOME/share"

# Go (golang)
if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
    PATH="$PATH:$GOPATH/bin"
fi

export EDITOR HOME PAGER PATH TERM

# Export the environment if the shell is interactive.
export ENV=$HOME/.kshrc
