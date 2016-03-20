ZSHDIR=$HOME/.zsh
source ~/.zplug/zplug

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "b4b4r07/zplug"
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/lein", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/fabric", from:oh-my-zsh
zplug "plugins/debian", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "themes/ys", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

setopt HIST_FIND_NO_DUPS

# source /usr/share/autojump/autojump.sh

eval `dircolors /home/markus/config/dircolors/dircolors.moonshine`



# aliases
# ls
alias lr='ls -larth'
alias sudo='sudo PATH=$PATH'


# misc
alias dc='docker-compose'
alias fuck='eval $(thefuck $(fc -ln -1))'
alias FUCK='fuck'
alias f='fuck'

alias jd='desk .'

## git
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias gd='git diff '
alias go='git checkout '
alias gl='git hist '
alias gh='git_select_hash'
alias gt='git tag '
alias goc='git_checkout_interactive'

## apps
alias top='htop'
#alias zile='/home/markus/local/bin/emacsclient-t'
alias df='di'
#alias grep='ag'

# exports
# export ALTERNATE_EDITOR=""
# export EDITOR="/home/markus/local/bin/emacsclient-t"
# $EDITOR should open in terminal
# export VISUAL="/home/markus/local/bin/emacsclient-c"         # $VISUAL opens in GUI with non-daemon as alternate
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -s markus -t"
export VISUAL="emacsclient -s markus -c -a emacs"

alias emax="emacsclient -s markus -t"              
alias semax="sudo emacsclient -s markus -t"        
alias emacsc="emacsclient -s markus -c -a emacs"   
alias zile="et"

## functios
alias p='get_process_id'
alias k='kill_process'
alias kk='killkill_process'

alias calibre_update='calibre_update_function'

alias dc='docker-compose'
alias de='docker exec -i -t'

alias psg="ps aux|grep"
alias port="netstat -tulanp"
alias listen="lsof -P -i -n"
# unalias
unalias di
unalias ag

# bindkeys
 bindkey -e
 bindkey '^L' backward-kill-word  # helm-like delete last part of path

 # functions
 mcd() {
		 mkdir -p "$1"; cd "$1";
 }

 cls() {
		 cd "$1"; ll;
 }

 backup() {
		 mv "$1" "$1.bak"; mkdir "$1"
 }


calibre_update_function() {
	sudo -v && wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
}
git_checkout_interactive() {
	git_select_hash | xargs git checkout 
}

git_select_hash() {
	git hist | percol | awk '{print $2}' 
}

kill_process() {
	get_process_id | xargs kill 
}

killkill_process() {
	get_process_id | xargs kill -9 
}

get_process_id() {
	ps axu | percol --query="$USER " | awk '{print $2}'
}

function exists { which $1 &> /dev/null }

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^S' percol_select_history
fi

if exists fasd; then
		eval "$(fasd --init auto)"
		alias j='fasd_cd -d'
		alias jj='fasd_cd -d -i'
		unalias z
		alias z='f -e zile'
fi

# Setup suggestions
#zle-line-init() {
#    zle autosuggest-start
#}
#zle -N zle-line-init

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/src
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

export NIXPKGS=$HOME/Projects/Install/nix/nixpkgs
# export LOCALE_ARCHIVE=/home/markus/local/bin/locale-archive

#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv2
#source /usr/bin/virtualenvwrapper.sh

source /usr/local/bin/virtualenvwrapper.sh
source /home/markus/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# don't use cached auto-complete
zstyle ":completion:*:commands" rehash 1
# Hook for desk activation
[ ! -z "$DESK_ENV" ] && source "$DESK_ENV"


#source /home/markus/.nix-profile/etc/profile.d/nix.sh
