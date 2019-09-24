function fish_user_key_bindings
  fzf_key_bindings

  fzf_custom_key_bindings

  # Set Control^X,E to edit the command line
  bind \cx\ce 'edit_command_buffer'
end
