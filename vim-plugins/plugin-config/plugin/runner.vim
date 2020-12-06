" Shortcuts for vim-runner
nmap <leader>rr :StartCommandRunner<CR>
nmap <leader>rf :EnqueueTestRunCurrentFile<CR>
nmap <leader>rt :EnqueueTestRunAtCurrentLine<CR>

function! s:create_named_terminal_buffer(name, ...)
  let term_command = a:0 >= 1 ? a:000 : &shell
  enew
  call termopen(term_command, {'cwd': getcwd()})
  call s:rename_terminal_buffer(a:name)
endfunction

command! -nargs=+ CreateNamedShellTerminalBuffer :call s:create_named_terminal_buffer(<f-args>)
nmap <leader>tn :CreateNamedShellTerminalBuffer<space>

function! s:rename_terminal_buffer(name)
  let b:term_title = a:name . ' (' . bufname('%') . ')'
endfunction

command! -nargs=1 RenameTerminalBuffer :call s:rename_terminal_buffer(<q-args>)
nmap <leader>tr :RenameTerminalBuffer<space>

command! -nargs=0 CreateGitTerminalBuffer :call s:create_named_terminal_buffer('git')
nmap <leader>tg :CreateGitTerminalBuffer<CR>

command! -nargs=0 CreateYarnWatchTerminalBuffer :call s:create_named_terminal_buffer('yarn', './bin/yarn', 'watch')
nmap <leader>ty :CreateYarnWatchTerminalBuffer<CR>

command! -nargs=0 CreateShoryukenWorkerTerminalBuffer :call s:create_named_terminal_buffer('worker', 'bundle', 'exec', 'shoryuken', '-R')
nmap <leader>tw :CreateShoryukenWorkerTerminalBuffer<CR>

command! -nargs=0 CreateRailsConsoleTerminalBuffer :call s:create_named_terminal_buffer('console', './bin/rails', 'console')
nmap <leader>tc :CreateRailsConsoleTerminalBuffer<CR>

