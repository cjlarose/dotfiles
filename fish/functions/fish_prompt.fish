function fish_prompt --description 'Write out the prompt'
  set -l suffix '$'
  echo -n -s (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) " $suffix "
end
