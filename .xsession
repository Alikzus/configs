#!/bin/sh

export LC_CTYPE="sv_SE.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

fonts=$(find /usr/local/share/fonts/* -type d)
for font in $fonts ; do
    xset +fp "$font"
done

if [ -f "$HOME/.Xresources" ]; then
    xrdb -load "$HOME/.Xresources"
fi

cwm
