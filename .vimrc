" Map leader key to ,
let mapleader = ","

" Enable both relative number and number to turn on 'hybrid mode'
set relativenumber
set number

" Write spaces instead of tabs when hitting <tab>
set expandtab

" Write exactly 2 spaces when hitting <tab>
set tabstop=2

" Use 2 spaces for indentation
set shiftwidth=2

" Highlight search results
set hlsearch

" Map fd in insert mode to esc
inoremap fd <Esc>

" Replace hash rockets with Ruby 1.9-style hashes
let @h = ":s/:\\([^=,'\"]*\\) =>/\\1:/g\<C-m>"

" Show whitespace characters (tabs, trailing spaces)
set list

" Allow modified buffers to be hidden (except for netrw buffers)
" https://github.com/tpope/vim-vinegar/issues/13
set nohidden
augroup netrw_buf_hidden_fix
  autocmd!

  " Set all non-netrw buffers to bufhidden=hide
  autocmd BufWinEnter *
    \  if &ft != 'netrw'
    \|   set bufhidden=hide
    \| endif
augroup end

" Highlight purescript files as if they were Haskell files
au BufRead,BufNewFile *.purs set filetype=haskell

" Set the statusline of terminal buffers to the term title
autocmd TermOpen * setlocal statusline=%{b:term_title}

""""""""""""""""""""""""
" PLUGIN CONFIGURATION "
""""""""""""""""""""""""

" Run neomake on every write
autocmd! BufWritePost * Neomake

" Do not execute eslint from cwd
let g:neomake_javascript_eslint_maker = {
        \ 'args': ['--format=compact'],
        \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
        \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#',
        \ 'output_stream': 'stdout',
        \ }

" Turn on color scheme
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1
set background=dark
colorscheme hybrid

" set prefix for FZF functions
let g:fzf_command_prefix = 'Fzf'

" Key mappings for fzf plugin
nmap <leader>f :FzfGFiles<CR>
nmap <leader>bb :FzfBuffers<CR>
nmap <leader>c :FzfHistory:<CR>

" Ack.vim config
let g:ack_default_options = ' -s -H --nopager --nocolor --nogroup --column --sort-files'
let g:ack_mappings = {
  \ "<C-X>": "<C-W><CR><C-W>K",
  \ "<C-V>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t" }

" Search the project for a specified string
nmap <leader>g :Ack!<space>

" Search the project for the string under the cursor
nmap <leader>w :Ack!<space><cword><CR>

" Disable indenting for haskell
let g:haskell_indent_disable = 1

" autoformat settings
noremap <leader>a :Autoformat<CR>
let g:formatters_ruby = ['rubocop']
let g:formatdef_rubocop = "'~/bin/rubocop-auto-correct-range '.a:firstline.' '.a:lastline.' '.bufname('%')"
let g:formatters_haskell = ['brittany']
let g:formatdef_brittany = '"brittany"'

" Tab title
let g:taboo_tab_format = " %P "

" Custom convenience function for creating logbook entries
" https://routley.io/tech/2017/11/23/logbook.html
nmap <leader>ln :LogbookNew<space>
nmap <leader>ll :LogbookList<CR>

" Shortcuts for vim-runner
nmap <leader>rr :StartCommandRunner<CR>
nmap <leader>rf :EnqueueTestRunCurrentFile<CR>
nmap <leader>rt :EnqueueTestRunAtCurrentLine<CR>

function! s:create_named_terminal_buffer(name, ...)
  let term_command = a:0 >= 1 ? a:000 : $SHELL
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

" delete buffer but keep window open
" https://superuser.com/questions/289285/how-to-close-buffer-without-closing-the-window
command! DeleteBufferSafely :bn|:bd#
nmap <leader>bd :DeleteBufferSafely<CR>

" Disable default key bindings for vim-markdown
let g:vim_markdown_no_default_key_mappings = 1
