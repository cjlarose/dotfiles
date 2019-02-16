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

" Commenting
Plug 'tpope/vim-commentary'

" Auto-formatting
Plug 'Chiel92/vim-autoformat'

" Allows changing tab title easily
Plug 'gcmt/taboo.vim'

" Custom plugins
Plug '~/.vim/plugged/vim-logbook'
Plug '~/.vim/plugged/vim-runner'

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

" set prefix for FZF functions
let g:fzf_command_prefix = 'Fzf'

" Key mappings for fzf plugin
nmap <leader>t :FzfGFiles<CR>
nmap <leader>bb :FzfBuffers<CR>

" Search the project for a specified string
nmap <leader>f :FzfRg<space>

" Search the project for the string under the cursor
function! s:fzf_rg_expand(query)
  let l:expanded_query = expand(a:query)
  execute 'FzfRg ' . l:expanded_query
endfunction
command! -nargs=0 FzfFindWordUnderCursor :call s:fzf_rg_expand('<cword>')
nmap <leader>w :FzfFindWordUnderCursor<CR>

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
