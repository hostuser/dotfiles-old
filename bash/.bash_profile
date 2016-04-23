. $HOME/.bashrc

# Make sure the users bin directory will be searched in first place.
if [ -d $HOME/bin ]
then
    export PATH=$HOME/bin:$PATH
fi

# virtualenvwrapper
if [ -e /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then . /usr/share/virtualenvwrapper/virtualenvwrapper.sh; fi
if [ -e /usrlocal/bin/virtualenvwrapper.sh ]; then . /usr/local/bin/virtualenvwrapper.sh; fi

export WORKON_HOME=~/.virtualenvs
if [ -e /home/markus/.nix-profile/etc/profile.d/nix.sh ]; then . /home/markus/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval $(thefuck --alias)
