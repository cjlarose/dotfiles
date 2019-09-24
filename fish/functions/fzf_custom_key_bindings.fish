function fzf_custom_key_bindings
  function fzf-git-branch-widget -d 'List git branches'
    set -l last_token (commandline -t)

    set -l repo_info (git rev-parse --git-dir --is-inside-git-dir \
      --is-bare-repository --is-inside-work-tree \
      --short HEAD 2>/dev/null)
    and set -l branches (git branch --all | grep -v HEAD)
    and begin
      set -l result
      string join \n $branches | \
        fzf --no-multi --height 40% --reverse --query "$last_token" | \
        while read -l r; set result $result $r; end
      if [ -z "$result" ]
        commandline -f repaint
        return
      end
      set -l branch (echo $result[1] | sed 's/.* //')
      commandline -t ''
      commandline -it -- $branch
    end
  end

  bind \cg fzf-git-branch-widget
end
