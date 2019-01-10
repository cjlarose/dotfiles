" Start loading plugins
call plug#begin('~/.vim/plugged')

" Sensible defaults
Plug 'tpope/vim-sensible'

" Programming language support
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/VimClojure'
Plug 'neovimhaskell/haskell-vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/groovy.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'

" Elm support
Plug 'ElmCast/elm-vim'

" Async make. Linting mostly
Plug 'benekastah/neomake'

" Color scheme
Plug 'cjlarose/vim-hybrid'

" Fuzzy file finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Git(hub) integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Shortcuts for pairs of commands
Plug 'tpope/vim-unimpaired'

" Search through file conents
Plug 'mileszs/ack.vim'

" Commenting
Plug 'tpope/vim-commentary'

" Auto-formatting
Plug 'Chiel92/vim-autoformat'

" Add plugins to &runtimepath
call plug#end()

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

" Allow modified buffers to be hidden
set hidden

" Highlight purescript files as if they were Haskell files
au BufRead,BufNewFile *.purs set filetype=haskell

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

" Key mappings for fzf plugin
nmap <leader>t :FZF<CR>
nmap <leader>bb :Buffers<CR>

" Respect .gitignore in fzf
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'

" Ack.vim config
if executable('rg')
  let g:ackprg = 'rg --sort-files --vimgrep'
endif

" Shortcuts for Ack
nmap <leader>f :Ack!<space>
nmap <leader>w :Ack!<space><cword><CR>

" Modify ack.vim mappings
let g:ack_mappings = {
  \ "<C-X>": "<C-W><CR><C-W>K",
  \ "<C-V>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t" }

" Disable indenting for haskell
let g:haskell_indent_disable = 1

" autoformat settings
noremap <leader>a :Autoformat<CR>
let g:formatters_ruby = ['rubocop']
let g:formatdef_rubocop = "'~/bin/rubocop-auto-correct-range '.a:firstline.' '.a:lastline.' '.bufname('%')"
let g:formatters_haskell = ['brittany']
let g:formatdef_brittany = '"brittany"'

" Custom convenience function for creating logbook entries
" https://routley.io/tech/2017/11/23/logbook.html
function! s:logbook_new(name)
  let l:basename = strftime('%Y-%m-%d') . '-' . a:name . '.md'
  let l:fname = fnamemodify("~/logbook/" . l:basename, ":p")
  execute "e " . l:fname
endfunction

command! -nargs=1 LogbookNew :call s:logbook_new(<q-args>)
nmap <leader>ln :LogbookNew<space>

function! s:logbook_list()
  execute 'Files ' . fnamemodify("~/logbook/", ":p")
endfunction

command! -nargs=0 LogbookList :call s:logbook_list()
nmap <leader>ll :LogbookList<CR>
