#!/bin/sh

# shellcheck source=/dev/null
. "$HOME/.profile" &

fonts=$(find /usr/local/share/fonts/* -type d)
for font in $fonts ; do
    xset +fp "$font" &
done

xrdb -load "$HOME/.Xresources" &
xset b off &
setxkbmap -option caps:escape

[ -x "$HOME/lemonbar.sh" ] && "$HOME/lemonbar.sh" &

env LC_CTYPE="en_US.UTF-8" /usr/X11R6/bin/cwm
