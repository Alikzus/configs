#!/bin/sh

fonts=$(find /usr/local/share/fonts/* -type d)
for font in $fonts ; do
    xset +fp "$font"
done

if [ -f "$HOME/.Xresources" ]; then
    xrdb -load "$HOME/.Xresources"
elif [ -f "$HOME/.Xdefaults" ]; then
    xrdb -load "$HOME/.Xdefaults"
fi

if [ -x "/usr/local/bin/spectrwm" ]; then
    /usr/local/bin/spectrwm
else
    /usr/X11R6/bin/cwm
fi
