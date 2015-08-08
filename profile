# ~/.profile -- OpenBSD Korn shell profile
# joel at alikzus.se, 2015-07-22
# http://www.alikzus.se

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games:.

export PATH HOME TERM

export EDITOR=vim

export PAGER=less

# UTF-8 seems to be the future. Default to this as a first trial...
export LC_CTYPE=sv_SE.UTF-8
export LC_MESSAGES=en_US.UTF-8

# Perl5 local::lib
PATH="$HOME/perl5/bin${PATH+:}${PATH}"
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
PERL_MB_OPT="--install_base \"$HOME/perl5\""
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export PATH PERL5LIB PERL_LOCAL_LIB_ROOT PERL_MB_OPT PERL_MM_OPT

# Export the environment if the shell is interactive.
export ENV=$HOME/.kshrc
