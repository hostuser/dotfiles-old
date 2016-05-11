#! /bin/bash

ACCOUNT=$1

mbsync -c ~/dotfiles/mbsync/.mbsyncrc ${ACCOUNT} 2>&1 >> /tmp/maillog
