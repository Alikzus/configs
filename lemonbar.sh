#!/bin/sh

# Author: Joel A. Hänel <joel@hanel.nu>, 2018
# Credits: GuinansEyebrows
# Last changed: 2018-08-20 12:26:07 CEST
 
clock() {
    date +'%F %H:%M'
}

mpd() {
    if mpc status | awk 'NR==2' | grep -Eq 'playing|paused'
    then
        mpc current | cut -c 1-48
    fi
   
}
 
while true; do
    echo "%{c}$(clock) %{r}$(mpd)"
    sleep 1
done | lemonbar -d -g 2560x19 -B "#000000" -F "#707070" -U "#707070" -f -*-terminus-medium-*-*-*-16-*-*-*-*-*-iso8859-*
