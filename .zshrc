# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt share_history

# emacs mode
bindkey -e

# Completion
zstyle :compinstall filename '/home/cjlarose/.zshrc'
autoload -Uz compinit
compinit

# Prompt
autoload -Uz promptinit
promptinit
setopt PROMPT_SUBST
. ~/.git-prompt.sh
PROMPT="%~ $ "
RPROMPT=$'$(__git_ps1 "%s")'

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Program preferences
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/vim
PAGER=/usr/bin/less

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# nvm
export NVM_DIR="/home/cjlarose/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Add node_modules to PATH
export PATH=./node_modules/.bin:$PATH

# fzf
. /usr/share/fzf/completion.zsh
. /usr/share/fzf/key-bindings.zsh

# send rg through pager
function rgp()
{
  /usr/bin/rg -p "$@" | less -R
}

. ~/.zshrc-aliases

# Run local setup
if [ -f "$HOME/.zshrc-local" ]; then
  . ~/.zshrc-local
fi
