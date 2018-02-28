# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups

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
PROMPT=$'%~ %F{green}$(__git_ps1 "%s")%f $ '

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Bulk rename
autoload -U zmv

# Program preferences
export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/vim
export PAGER=/usr/bin/less

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Add node_modules to PATH
export PATH=./node_modules/.bin:$PATH

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fasd
eval "$(fasd --init auto)"

# send rg through pager
function rgp()
{
  rg --pretty "$@" | less --quit-if-one-screen --RAW-CONTROL-CHARS --no-init
}

# https://routley.io/tech/2017/11/23/logbook.html
function lb()
{
  vim ~/logbook/$(date '+%Y-%m-%d').md
}

. ~/.zshrc-aliases

# Run local setup
if [ -f "$HOME/.zshrc-local" ]; then
  . ~/.zshrc-local
fi
