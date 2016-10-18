LOG="$HOME/profile-invocations"
echo "-----" >>$LOG
echo "Caller: $0" >>$LOG
echo "DESKTOP_SESSION: $DESKTOP_SESSION" >>$LOG
echo "GDMSESSION: $GDMSESSION" >>$LOG


export PATH=/home/markus/local/bin:/home/markus/.local/bin:/usr/local/bin:/opt/idea/bin:/opt/mvn/bin:$PATH
export PYTHONPATH=$HOME/.nix-profile/lib/python2.7/site-packages

if [ -e /home/markus/.nix-profile/etc/profile.d/nix.sh ]; then . /home/markus/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

GPG_TTY=$(tty)
export GPG_TTY

export GOPATH="/home/markus/local/share/go"
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"

export XDG_DATA_DIRS=/home/markus/.nix-profile/share:/usr/local/share/:/usr/share

export GTAGSLABEL=pygments
