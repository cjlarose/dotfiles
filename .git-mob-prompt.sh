function __get_coauthors_by_email()
{
  local emails=("$@")
  local names=()
  for email in "${emails[@]}"; do
    local filter='.coauthors | to_entries[] | select(.value.email == "'"$email"'") | .key'
    if name=$(jq --exit-status --raw-output "$filter" ~/.git-coauthors); then
      names+=("$name")
    else
      names+=('[unknown]')
    fi
  done
  echo "${names[@]}"
}

function __git_mob_ps1()
{
  if current_mob=$(git config --get-all git-mob.co-author); then
    local emails=("${(@f)$(gsed -n 's/.*<\(.*\)>/\1/p' <<< "$current_mob")}")
    local names=("${(@f)$(__get_coauthors_by_email "${emails[@]}")}")
    echo "${names[@]}"
  fi
}
