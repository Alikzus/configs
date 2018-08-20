#!/bin/sh

fonts=$(find /usr/local/share/fonts/* -type d)
for font in $fonts ; do
    xset +fp "$font"
done

if [ -f "$HOME/.Xresources" ]; then
    xrdb -load "$HOME/.Xresources"
fi

~/configs/lemonbar.sh &

env LC_CTYPE="en_US.UTF-8" /usr/X11R6/bin/cwm
