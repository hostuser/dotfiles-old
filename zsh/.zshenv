export PATH=/home/markus/local/bin:$PATH
source /home/markus/.nix-profile/etc/profile.d/nix.sh

if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
  export SSH_AUTH_SOCK
  export SSH_AGENT_PID
fi

GPG_TTY=$(tty)
export GPG_TTY
