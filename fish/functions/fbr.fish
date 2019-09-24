# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
# Adapted for fish from https://github.com/junegunn/fzf/wiki/examples#git
function fbr
  set -l branches (git branch --all | grep -v HEAD)
  and set -l branch (string join \n $branches | fzf --no-multi --height 40% --reverse)
  and git checkout (echo $branch | sed 's/.* //' | sed 's#remotes/[^/]*/##')
end
