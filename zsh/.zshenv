export PATH=/home/markus/local/bin:$PATH
source /home/markus/.nix-profile/etc/profile.d/nix.sh

export XDG_DATA_DIRS=/home/markus/.nix-profile/share:/usr/local/share/:/usr/share

GPG_TTY=$(tty)
export GPG_TTY
