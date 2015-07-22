# ~/.profile -- OpenBSD Korn shell profile
# joel at alikzus.se, 2015-07-22
# http://www.alikzus.se

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

export PATH HOME TERM

export EDITOR=vim

export PAGER=less

# UTF-8 seems to be the future. Default to this as a first trial...
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Export the environment if the shell is interactive.
export ENV=$HOME/.kshrc
