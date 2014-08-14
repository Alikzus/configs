# .profile -- OpenBSD Korn shell profile

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

export PATH HOME TERM

export EDITOR=vim

export PKG_PATH=http://ftp.eu.openbsd.org/pub/OpenBSD/5.5/packages/amd64

export LC_CTYPE=sv_SE.ISO8859-1

# Export the environment if the shell is interactive.
export ENV=$HOME/.kshrc
