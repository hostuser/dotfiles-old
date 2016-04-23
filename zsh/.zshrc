ZSHDIR=$HOME/.zsh
source ~/.zplug/zplug

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"

zplug "b4b4r07/zplug"
source /usr/local/bin/activate.sh
zplug "plugins/autoenv", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/lein", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/gradle", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/fabric", from:oh-my-zsh
zplug "plugins/debian", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/rsync", from:oh-my-zsh
zplug "plugins/pass", from:oh-my-zsh
zplug "themes/ys", from:oh-my-zsh
# zplug "tylerreckart/odin"

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

get_process_parents() {
    get_process_id | xargs pstree --show-parents
}

current_firefox_tab_number() {
    python2 <<< $'import json\nf = open("/home/markus/.mozilla/firefox/febeprof.restore/sessionstore-backups/recovery.js", "r")\njdata = json.loads(f.read())\nf.close()\nprint str(jdata["windows"][0]["selected"])'
}

current_firefox_url() {
    sed -n "$(current_firefox_tab_number)p" <(python2 <<< $'import json\nf = open("/home/markus/.mozilla/firefox/febeprof.restore/sessionstore-backups/recovery.js", "r")\njdata = json.loads(f.read())\nf.close()\nfor win in jdata.get("windows"):\n\tfor tab in win.get("tabs"):\n\t\ti = tab.get("index") - 1\n\t\tprint tab.get("entries")[i].get("url")')
}

connect() {
    docker exec -i -t "$1" /bin/bash
}

debian_desktop() {
    docker run -it --rm -p 5901:5901 -v $1:/data -e USER=root debian-desktop bash
}

password_entries() {
      local IFS=$'\n'
      local prefix="${PASSWORD_STORE_DIR:-$HOME/.password-store}"
      find -L "$prefix" \( -name .git -o -name .gpg-id \) -prune -o $@ -print 2>/dev/null | sed -e "s#${prefix}/\{0,1\}##" -e 's#\.gpg##' | sort
}


function exists { which $1 &> /dev/null }


# aliases
# ls
alias lr='ls -larth'
alias sudo='sudo "PATH=$PATH"'

# verbose copy using rsync
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"

# misc
alias dc='docker-compose'
alias fuck='eval $(thefuck $(fc -ln -1))'
alias FUCK='fuck'
alias f='fuck'

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

## systemctl
alias sc='systemctl'
alias scs='systemctl start'
alias scu='systemctl status'
alias scr='systemctl restart'
alias sct='systemctl stop'
alias sce='systemctl enable'
alias scd='systemctl disable'

alias scu='systemctl --user'
alias scus='systemctl --user start'
alias scuu='systemctl --user status'
alias scur='systemctl --user restart'
alias scut='systemctl --user stop'
alias scue='systemctl --user enable'
alias scud='systemctl --user disable'

## nix
alias n='nix-env -qaP|grep'
alias ni='nix-env -i'
alias nun='nix-env --uninstall'
alias nup='nix-channel --update && nix-env --upgrade'

# misc
alias my_ip='curl  http://echoip.com'
alias get_pass="password_entries | grep -i / | percol | sed 's/.*/\"&\"/' | xargs pass "

# temporary aliases
alias old_pass='export PASSWORD_STORE_DIR=~/.password-store-old pass'
alias op='PASSWORD_STORE_DIR=~/.password-store-old pass'
alias old_get_pass="PASSWORD_STORE_DIR=~/.password-store-old password_entries | grep -i / | percol | sed 's/.*/\"&\"/'| PASSWORD_STORE_DIR=~/.password-store-old xargs pass "

## apps
if exists htop; then
    alias top='htop'
fi
if exists di; then
    alias df='di'
fi

export ALTERNATE_EDITOR=""
export EDITOR="et"
export VISUAL=""

alias zile="et"

alias p='get_process_id'
alias pp='get_process_parents'
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

# autoloads
export WORDCHARS="_-"
autoload select-word-style
select-word-style normal

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

if [ -e /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then . /usr/share/virtualenvwrapper/virtualenvwrapper.sh; fi
if [ -e /usrlocal/bin/virtualenvwrapper.sh ]; then . /usr/local/bin/virtualenvwrapper.sh; fi

export WORKON_HOME=$HOME/.virtualenvs

export NIXPKGS=$HOME/src/system/nixpkgs

# don't use cached auto-complete
zstyle ":completion:*:commands" rehash 1
