function fish_right_prompt
  set -l git_branch_color 'yellow'
  set -l repo_info (git rev-parse --git-dir --is-inside-git-dir \
    --is-bare-repository --is-inside-work-tree \
    --short HEAD 2>/dev/null)
  and begin
    set -l branch (git branch | sed -n '/\* /s///p' 2>/dev/null)
    set_color $git_branch_color
    echo "$branch"
  end
end
