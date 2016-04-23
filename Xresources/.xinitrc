#!/usr/bin/env bash

xrdb -merge ~/.Xresources

#dbus-launch --sh-syntax --exit-with-session i3 -V -d all > ~/.i3/i3log-$(date +'%F-%k-%M-%S') 2>&1d

xkbcomp -I$HOME/dotfiles/xkb $HOME/dotfiles/xkb/keymap/filco $DISPLAY 

if type "udiskie" > /dev/null; then
    udiskie --tray --use-udisks2 &
fi

exec i3
