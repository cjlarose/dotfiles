" Start loading plugins
call plug#begin('~/.vim/plugged')

" General Ruby shit
Plug 'vim-ruby/vim-ruby'

" Async make. Syntax highlighting mostly
Plug 'benekastah/neomake'

" Solarized color scheme
Plug 'altercation/vim-colors-solarized'

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" Add plugins to &runtimepath
call plug#end()

" Map leader key to ,
let mapleader = ","

" Run neomake on every write
autocmd! BufWritePost * Neomake

" Turn on solarized
set background=dark
colorscheme solarized

" Enable swapping background quickly
" http://tilvim.com/2013/07/31/swapping-bg.html
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Enable both relative number and number to turn on 'hybrid mode'
set relativenumber
set number

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Write spaces instead of tabs when hitting <tab>
set expandtab

" Write exactly 2 spaces when hitting <tab>
set tabstop=2

" Use 2 spaces for indendation
set shiftwidth=2
