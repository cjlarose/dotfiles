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

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
