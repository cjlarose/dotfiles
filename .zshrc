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
. ~/.git-mob-prompt.sh

function __prompt()
{
  local prompt=$'%~ '

  local git_prompt="$(__git_ps1 '%s')"
  if [[ -n $git_prompt ]]; then
    prompt="$prompt%F{green}$git_prompt%f "
  fi

  local git_mob_prompt="$(__git_mob_ps1)"
  if [[ -n $git_mob_prompt ]]; then
    prompt="$prompt%F{yellow}(mob: $git_mob_prompt)%f "
  fi

  prompt="$prompt$ "
  echo $prompt
}

PROMPT='$(__prompt)'

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Bulk rename
autoload -U zmv

# Program preferences
export BROWSER=/usr/bin/chromium
export EDITOR=vim
export PAGER=/usr/bin/less
export LESS='--quit-if-one-screen --RAW-CONTROL-CHARS --no-init'

# Add ~/bin to path
export PATH="$HOME/bin:$PATH"

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
  if ! [[ $1 ]]; then
    >&2 echo "Missing argument"
    return 1
  fi
  DATE=$(date '+%Y-%m-%d')
  FILENAME=${DATE}-$1
  $EDITOR ~/logbook/${FILENAME}.md
}

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# aliases
. ~/.zshrc-aliases

# Run local setup
if [ -f "$HOME/.zshrc-local" ]; then
  . ~/.zshrc-local
fi
