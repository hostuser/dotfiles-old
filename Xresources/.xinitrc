#!/bin/zsh
xrdb -merge ~/.Xresources

#dbus-launch --sh-syntax --exit-with-session i3 -V -d all > ~/.i3/i3log-$(date +'%F-%k-%M-%S') 2>&1d

xkbcomp -I$HOME/config/xkb $HOME/config/xkb/keymap/filco $DISPLAY

exec dbus-launch i3
