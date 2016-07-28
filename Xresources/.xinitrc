#!/bin/bash

if [ -f ~/.profile ]; then
	. ~/.profile
fi

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

echo $PATH > /tmp/path

~/.screenlayout/desk.sh

#pkill -9 gpg-agent eval $(gpg-agent --daemon --enable-ssh-support --sh)

eval $(gpg-agent --daemon)
export GPG_AGENT_INFO
export SSH_AUTH_SOCK
export SSH_AGENT_PID

exec i3
