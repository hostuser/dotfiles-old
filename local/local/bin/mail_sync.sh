#! /bin/bash

ACCOUNT=$1

mbsync -c ~/config/mbsync/.mbsyncrc ${ACCOUNT} 2>&1 >> /tmp/maillog
