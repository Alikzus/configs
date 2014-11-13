# ~/.profile -- OpenBSD Korn shell profile
# joel@alikzus.se, 2014-08-28.
# http://www.alikzus.se

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

export PATH HOME TERM

export EDITOR=vim

export PAGER=less

# Use latin1 while on an OpenBSD system.
# Use UTF8 in the other cases.
if [[ "$(uname)" = "OpenBSD" ]]; then
    export LC_CTYPE=sv_SE.ISO8859-1
else
    export LC_CTYPE=sv_SE.UTF8
fi

# Export the environment if the shell is interactive.
export ENV=$HOME/.kshrc
