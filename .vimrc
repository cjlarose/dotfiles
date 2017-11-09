" Start loading plugins
call plug#begin('~/.config/nvim/plugged')

" Programming language support
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/VimClojure'
Plug 'neovimhaskell/haskell-vim'
Plug 'leafgarland/typescript-vim'

" Elm support
Plug 'ElmCast/elm-vim'

" Async make. Linting mostly
Plug 'benekastah/neomake'

" Color scheme
Plug 'w0ng/vim-hybrid'

" Fuzzy file finder
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Git(hub) integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Search through file conents
Plug 'mileszs/ack.vim'

" Enable bracketed paste mode handling
Plug 'ConradIrwin/vim-bracketed-paste'

" Commenting
Plug 'tpope/vim-commentary'

" Add plugins to &runtimepath
call plug#end()

" Set reasonable backspace behavior
set backspace=indent,eol,start

" Map leader key to ,
let mapleader = ","

" Enable swapping background quickly
" http://tilvim.com/2013/07/31/swapping-bg.html
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Enable both relative number and number to turn on 'hybrid mode'
set relativenumber
set number

" Write spaces instead of tabs when hitting <tab>
set expandtab

" Write exactly 2 spaces when hitting <tab>
set tabstop=2

" Use 2 spaces for indentation
set shiftwidth=2

" Navigate to search results while typing
set incsearch

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

" Set location of fzf binary for fzf.vim
set rtp+=/usr/bin/fzf

" Ack.vim config
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
endif

" Shortcuts for Ack
nmap <leader>f :Ack!<space>
nmap <leader>w :Ack!<space><cword><CR>

" Modify ack.vim mappings
let g:ack_mappings = {
  \ "<C-X>": "<C-W><CR><C-W>K",
  \ "<C-V>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t" }

" Disable indenting for haskell
let g:haskell_indent_if = 2
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
