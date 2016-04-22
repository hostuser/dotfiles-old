. $HOME/.bashrc

# Make sure the users bin directory will be searched in first place.
if [ -d $HOME/bin ]
then
    export PATH=$HOME/bin:$PATH
fi

# virtualenvwrapper
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
export WORKON_HOME=~/.virtualenvs
if [ -e /home/markus/.nix-profile/etc/profile.d/nix.sh ]; then . /home/markus/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
eval $(thefuck --alias)
