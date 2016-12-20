#!/bin/sh
xrandr --output VGA-1 --off --output LVDS-1 --primary --mode 1366x768 --pos 2560x432 --rotate normal --output HDMI-3 --off --output HDMI-2 --off --output HDMI-

~/local/bin/switch-workspace.py 1 DP2
~/local/bin/switch-workspace.py 2 DP2
~/local/bin/switch-workspace.py 3 DP2
~/local/bin/switch-workspace.py 4 DP2
~/local/bin/switch-workspace.py 5 DP2

xkbcomp -I$HOME/dotfiles/xkb $HOME/dotfiles/xkb/keymap/filco $DISPLAY
