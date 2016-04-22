#! /bin/bash

ACCOUNT=$1
echo "Syncing folders for account: $ACCOUNT"
mbsync -c ~/config/mbsync/.mbsyncrc "$ACCOUNT-drafts" "$ACCOUNT-trash" "$ACCOUNT-sent" "$ACCOUNT-archive" "$ACCOUNT-folders"
