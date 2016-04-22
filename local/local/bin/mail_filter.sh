#! /bin/bash

ACCOUNT=$1

imapfilter -c ~/config/imapfilter/.imapfilter/config.${ACCOUNT}.lua
