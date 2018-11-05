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
export LESS='--quit-if-one-screen --RAW-CONTROL-CHARS --no-init'

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# nvm
[ -d "$HOME/.nvm" ] && export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# https://github.com/creationix/nvm/blob/217a5bb0de8290a229fdceba4671e3c219b68549/README.md#calling-nvm-use-automatically-in-a-directory-with-a-nvmrc-file
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Add node_modules to PATH
export PATH=./node_modules/.bin:$PATH

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fasd
eval "$(fasd --init auto)"

# send rg through pager
function rgp()
{
  rg --pretty "$@" | less
}

# https://routley.io/tech/2017/11/23/logbook.html
function lb()
{
  if [[ $1 ]]; then
    FILENAME=$1
  else
    FILENAME=$(date '+%Y-%m-%d')
  fi
  $EDITOR ~/logbook/${FILENAME}.md
}

# Add kubectl completion
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

. ~/.zshrc-aliases

# Run local setup
if [ -f "$HOME/.zshrc-local" ]; then
  . ~/.zshrc-local
fi
