#! /bin/bash

ACCOUNT=$1

imapfilter -c ~/dotfiles/imapfilter/.imapfilter/config.${ACCOUNT}.lua
