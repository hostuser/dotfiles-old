#!/bin/bash

# timestamp of previous mail sync
NBACK=$(date +%s --date="$1 sec ago")
NMAIL=$(mu find flag:u --after=$NBACK --fields "s" 2>/dev/null)

if [ ! -z "$NMAIL" ];
then
    notify-send --category=mail -t 20000 -i notification-message-email "New email" "$NMAIL"
fi
