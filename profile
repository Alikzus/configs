# ~/.profile -- profile for OpenBSD ksh(1), public domain Korn shell
#
# Author: Joel A. Nilsson <joel@alikzus.se>, 2014-2016
#

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

# Add Cabal
PATH=$HOME/.cabal/bin:$PATH

export PATH HOME TERM

if [ -x /usr/local/bin/vim ]; then
    export EDITOR=vim
else
    export EDITOR=vi
fi

export PAGER=less

export LC_CTYPE=sv_SE.UTF-8
export LC_MESSAGES=en_US.UTF-8

# Perl5 local::lib
if [ -d $HOME/perl5 ]; then
    export PATH="$HOME/perl5/bin${PATH+:}${PATH}"
    export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"
    export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
    export PERL_MB_OPT="--install_base \"$HOME/perl5\""
    export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
fi

# Export the environment if the shell is interactive.
export ENV=$HOME/.kshrc

#-------------------------------------------------------------------------------
# Last updated: 2016-09-10 17:19:22 CEST
