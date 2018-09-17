#!/bin/ksh

# Author: Joel A. Hänel <joel@hanel.nu>, 2018
# Credits: GuinansEyebrows
# Last changed: 2018-09-06 15:54:32 CEST

set -u

mpd() {
    if mpc status | awk 'NR==2' | grep -Eq 'playing|paused'; then
        mpc current | cut -c 1-48
    else
        printf "[]"
    fi
}
 
clock() {
    date +'%F %H:%M'
}

battery() {
    apm -l
}

wifi() {
    ifconfig iwm0 | grep ieee80211 | cut -d " " -f 8
}

multiplier=0
while true; do
    if [ $multiplier -gt 60 ]; then
        multiplier=0
    fi
    multiplier=$((multiplier + 1))
    if [ $multiplier -eq 1 ]; then
        mpd_playing=$(mpd)
        battery_level=$(battery)
        wifi_level=$(wifi)
    fi
    echo "%{l}${mpd_playing} %{c}$(clock) %{r}B=${battery_level}% W=${wifi_level}"
    sleep 1
done | lemonbar -d -g 1920x19 -B "#000000" -F "#707070" -U "#707070" -f -*-terminus-medium-*-*-*-16-*-*-*-*-*-iso8859-*
