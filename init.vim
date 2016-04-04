" Start loading plugins
call plug#begin('~/.vim/plugged')

" General Ruby shit
Plug 'vim-ruby/vim-ruby'

" JavaScript syntax & indentation
Plug 'pangloss/vim-javascript'

" Async make. Linting mostly
Plug 'benekastah/neomake'

" Solarized color scheme
Plug 'altercation/vim-colors-solarized'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git integration
Plug 'tpope/vim-fugitive'

" Buffer management
Plug 'jeetsukumaran/vim-buffergator'

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

" Write spaces instead of tabs when hitting <tab>
set expandtab

" Write exactly 2 spaces when hitting <tab>
set tabstop=2

" Use 2 spaces for indentation
set shiftwidth=2

" Key mappings for fzf plugin
nnoremap <leader>t :FZF<CR>

" Respect .gitignore in fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" Buffergator settings
let g:buffergator_suppress_keymaps = 1
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
nmap <leader>kk :BuffergatorMruCycleNext<cr>
nmap <leader>bl :BuffergatorOpen<cr>
nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>
