#!/bin/sh
xrandr --output DP3 --off --output DP2 --off --output DP1 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal --output VGA1 --off

~/local/bin/switch-workspace.py 1 LVDS1
~/local/bin/switch-workspace.py 2 LVDS1
~/local/bin/switch-workspace.py 3 LVDS1
~/local/bin/switch-workspace.py 4 LVDS1
~/local/bin/switch-workspace.py 5 LVDS1

xkbcomp -I$HOME/dotfiles/xkb $HOME/dotfiles/xkb/keymap/filco $DISPLAY
