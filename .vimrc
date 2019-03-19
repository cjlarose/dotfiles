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

" Allow hiding modified buffers
set hidden

" Highlight purescript files as if they were Haskell files
au BufRead,BufNewFile *.purs set filetype=haskell

" Always show tab lie
set showtabline=2

" Set the statusline of terminal buffers to the term title
autocmd TermOpen * setlocal statusline=%{b:term_title}

""""""""""""""""""""""""
" PLUGIN CONFIGURATION "
""""""""""""""""""""""""

" Run neomake on every write
autocmd! BufWritePost * Neomake

" Use 'bundle exec' when running rubocop in neomake
let g:neomake_ruby_rubocop_maker_exe = 'bundle exec rubocop'

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

" ctrlspace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

" set prefix for FZF functions
let g:fzf_command_prefix = 'Fzf'

" Key mappings for fzf plugin
nmap <leader>f :FzfGFiles<CR>
nmap <leader>bb :FzfBuffers<CR>
nmap <leader>c :FzfHistory:<CR>

" Ack.vim config
if executable('rg')
  let g:ackprg = 'rg --sort-files --vimgrep'
endif
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
  let term_command = a:0 >= 1 ? a:1 : $SHELL
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

" delete buffer but keep window open
" https://superuser.com/questions/289285/how-to-close-buffer-without-closing-the-window
command! DeleteBufferSafely :bn|:bd#
nmap <leader>bd :DeleteBufferSafely<CR>

" Disable default key bindings for vim-markdown
let g:vim_markdown_no_default_key_mappings = 1
