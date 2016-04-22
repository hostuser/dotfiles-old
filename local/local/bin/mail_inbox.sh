#! /bin/bash

echo "Filtering mailbox: $1" >> /tmp/maillog
mail_filter.sh "$1" >> /tmp/maillog
echo "Syncing mailbox: $1-inbox" >> /tmp/maillog
mail_sync.sh "$1-inbox" >> /tmp/maillog
echo "Done: $1-inbox" >> /tmp/maillog
