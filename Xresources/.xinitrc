#!/bin/zsh

# Test if $1 is available
isavailable() {
    type "$1" &>/dev/null
}

xrdb -merge ~/.Xresources
xkbcomp -I$HOME/dotfiles/xkb $HOME/dotfiles/xkb/keymap/filco $DISPLAY

isavailable autocutsel && {
    autocutsel -fork &
    autocutsel -selection PRIMARY -fork &
}

isavailable redshift && redshift &

isavailable udiskie && udiskie --tray --use-udisks2 &

exec i3
