# Prompt configuration

. /usr/local/etc/bash_completion.d/git-prompt.sh
. ~/.git-mob-prompt.sh

function __prompt()
{
  local parts=()

  parts+=('\w')

  local git_prompt
  if git_prompt="$(__git_ps1 '%s' 2> /dev/null)" && [[ -n $git_prompt ]]; then
    parts+=("\[\e[32m\]$git_prompt\[\e[00m\]")
  fi

  local git_mob_prompt
  if git_mob_prompt="$(__git_mob_ps1 2> /dev/null)" && [ -n "$git_mob_prompt" ]; then
    parts+=("\[\e[33m\](mob: $git_mob_prompt)\[\e[00m\]")
  fi

  parts+=('$')

  echo "${parts[*]} "
}

function set_bash_prompt()
{
  PS1="$(__prompt)"
}
PROMPT_COMMAND=set_bash_prompt

# Program preferences
export EDITOR=nvim
export LESS='--quit-if-one-screen --RAW-CONTROL-CHARS --no-init'
export THOR_MERGE='nvr -s -d'

# Add ~/bin to path
export PATH="$HOME/bin:$PATH"

# Add node_modules to PATH
export PATH=./node_modules/.bin:$PATH

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Convenience functions
function rgp()
{
  rg --pretty --sort path "$@" | less
}

function git-make-patch-statement() {
  DIFF=$(git diff)
  echo 'git apply <<'"'"'PATCH'"'"
  echo "$DIFF"
  echo 'PATCH'
}

# Aliases
. ~/aliases.sh

# Run local setup
if [ -f "$HOME/.bashrc-local" ]; then
  . ~/.bashrc-local
fi
