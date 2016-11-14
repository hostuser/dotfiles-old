# Setup fzf
# ---------
if [[ ! "$PATH" == */home/markus/.fzf/bin* ]]; then
  export PATH="$PATH:/home/markus/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/markus/.fzf/man* && -d "/home/markus/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/markus/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/markus/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/markus/.fzf/shell/key-bindings.zsh"

