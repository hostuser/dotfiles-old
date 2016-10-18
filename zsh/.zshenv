export PATH=$HOME/local/bin:$PATH
source $HOME/.nix-profile/etc/profile.d/nix.sh

export XDG_DATA_DIRS=$HOME/.nix-profile/share:/usr/local/share/:/usr/share

GPG_TTY=$(tty)
export GPG_TTY

export GTAGSLABEL=pygments
