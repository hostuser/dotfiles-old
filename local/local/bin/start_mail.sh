#! /usr/bin/env sh

set -e

$HOME/.nix-profile/bin/pass misc/dummy

systemctl --user start mail_markus_folders.timer
systemctl --user start mail_markus_inbox.timer
systemctl --user start mail_posteo_folders.timer
systemctl --user start mail_posteo_inbox.timer
systemctl --user start mail_work_folders.timer
systemctl --user start mail_work_inbox.timer
