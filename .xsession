#!/bin/sh

# shellcheck source=/dev/null
. "$HOME/.profile" || exit 1

fonts=$(find /usr/local/share/fonts/* -type d)
for font in $fonts ; do
    xset +fp "$font"
done

xrdb -load "$HOME/.Xresources" || exit 1

~/configs/lemonbar.sh &

env LC_CTYPE="en_US.UTF-8" /usr/X11R6/bin/cwm
