#!/bin/zsh

# Test if $1 is available
isavailable() {
    type "$1" &>/dev/null
}

xrdb -merge ~/.Xresources
xkbcomp -I$HOME/config/xkb $HOME/config/xkb/keymap/filco $DISPLAY

isavailable autocutsel && {
    autocutsel -fork &
    autocutsel -selection PRIMARY -fork &
}

isavailable redshift && redshift &

exec dbus-launch i3
