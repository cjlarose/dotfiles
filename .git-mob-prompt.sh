function __get_coauthor_by_email()
{
  local email="$1"
  local filter='.coauthors | map_values(select(.email == "'"$email"'")) | keys | .[0]'
  jq --exit-status --raw-output "$filter" ~/.git-coauthors
}

function __git_mob_ps1()
{
  if current_mob=$(git config --get-all git-mob.co-author); then
    local emails=("${(@f)$(gsed -n 's/.*<\(.*\)>/\1/p' <<< "$current_mob")}")

    local names=()
    for email in "${emails[@]}"; do
      if name=$(__get_coauthor_by_email "$email"); then
        names+=("$name")
      fi
    done

    echo "${names[@]}"
  fi
}
