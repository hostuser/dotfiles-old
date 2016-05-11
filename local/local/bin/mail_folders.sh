#! /bin/bash

ACCOUNT=$1
echo "Syncing folders for account: $ACCOUNT"
mbsync -c ~/dotfiles/mbsync/.mbsyncrc "$ACCOUNT-drafts" "$ACCOUNT-trash" "$ACCOUNT-sent" "$ACCOUNT-archive" "$ACCOUNT-folders"
