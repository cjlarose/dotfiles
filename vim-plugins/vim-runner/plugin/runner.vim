" Create a temporary named piped to send commands to
function! s:create_command_pipe()
  if !exists("s:command_pipe")
    let s:command_pipe = tempname()
    echom system("mkfifo -m 600 " . fnamemodify(s:command_pipe, ':S'))
  endif
  return s:command_pipe
endfunction

function! s:start_command_runner()
  let l:command = 'xargs -t -I{} $SHELL -c {} <> ' . fnamemodify(s:create_command_pipe(), ':S')
  execute 'terminal ' . l:command
  execute 'file runner'
endfunction

command! -nargs=0 StartCommandRunner :call s:start_command_runner()

function! s:enqueue_command(cmd)
  call writefile([a:cmd], s:create_command_pipe())
endfunction

command! -nargs=1 EnqueueCommand :call s:enqueue_command(<q-args>)

function! s:enqueue_test_run_current_file()
  let l:cmd = './bin/rails test --color ' . expand('%')
  call s:enqueue_command(l:cmd)
endfunction

command! -nargs=0 EnqueueTestRunCurrentFile :call s:enqueue_test_run_current_file()

function! s:enqueue_test_run_at_current_line()
  let l:cmd = './bin/rails test --color ' . expand('%') . ':' . line('.')
  call s:enqueue_command(l:cmd)
endfunction

command! -nargs=0 EnqueueTestRunAtCurrentLine :call s:enqueue_test_run_at_current_line()
