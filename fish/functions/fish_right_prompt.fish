function prompt_git_branch
  set -l repo_info (git rev-parse --git-dir --is-inside-git-dir \
    --is-bare-repository --is-inside-work-tree \
    --short HEAD 2>/dev/null)
  and begin
    set -l branch (git branch | sed -n '/\* /s///p' 2>/dev/null)
    echo "$branch"
  end
end

function prompt_git_mob
  set -l initials (git mob-print --initials)
  if test -n "$initials"
    echo -n -s '(with ' $initials ')'
  end
end

function fish_right_prompt
  set -l git_branch_color 'yellow'
  set_color $git_branch_color
  prompt_git_branch
  set_color normal

  set -l mob (prompt_git_mob)
  if test -n "$mob"
    echo -n " $mob"
  end
end
