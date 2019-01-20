function __get_coauthors_by_email()
{
  local emails=("$@")
  local literals=()
  for email in "${emails[@]}"; do
    literals+=('"'"$email"'"')
  done
  local search='['${(j:,:)literals}']'
  local filter='.coauthors | to_entries[] | select([.value.email] | inside('"$search"')) | .key'
  jq --exit-status --raw-output "$filter" ~/.git-coauthors
}

function __git_mob_ps1()
{
  if current_mob=$(git config --get-all git-mob.co-author); then
    local emails=("${(@f)$(gsed -n 's/.*<\(.*\)>/\1/p' <<< "$current_mob")}")
    local names=("${(@f)$(__get_coauthors_by_email "${emails[*]}")}")
    echo "${names[@]}"
  fi
}
