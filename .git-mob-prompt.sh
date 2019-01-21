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
    local names=()
    while IFS=$'\n' read -r line; do
      names+=("$line")
    done < <(sed -n 's/.*<\(.*\)>/\1/p' <<< "$current_mob")
    __get_coauthors_by_email "${names[@]}"
  fi
}
