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
zstyle :compinstall filename "$HOME/.zshrc"
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
  local parts=()

  parts+=($'%~')

  local git_prompt="$(__git_ps1 '%s')"
  if [[ -n $git_prompt ]]; then
    parts+=("%F{green}$git_prompt%f")
  fi

  local git_mob_prompt="$(__git_mob_ps1)"
  if [[ -n $git_mob_prompt ]]; then
    parts+=("%F{yellow}(mob: $git_mob_prompt)%f")
  fi

  parts+=('$')

  echo "${parts[@]} "
}

PROMPT='$(__prompt)'

# Allow command line editing in an external editor.
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Bulk rename
autoload -U zmv

# Program preferences
export EDITOR=vim
export PAGER=/usr/bin/less
export LESS='--quit-if-one-screen --RAW-CONTROL-CHARS --no-init'

# Add ~/bin to path
export PATH="$HOME/bin:$PATH"

# Add node_modules to PATH
export PATH=./node_modules/.bin:$PATH

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
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

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# aliases
. ~/.zshrc-aliases

# Run local setup
if [ -f "$HOME/.zshrc-local" ]; then
  . ~/.zshrc-local
fi
