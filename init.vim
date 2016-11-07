" Start loading plugins
call plug#begin('~/.config/nvim/plugged')

" General Ruby shit
Plug 'vim-ruby/vim-ruby'

" JavaScript syntax & indentation
Plug 'pangloss/vim-javascript'

" Clojure syntax & indentation
Plug 'vim-scripts/VimClojure'

" Async make. Linting mostly
Plug 'benekastah/neomake'

" Solarized color scheme
Plug 'altercation/vim-colors-solarized'

" Fuzzy file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Ack/Ag integration
Plug 'mileszs/ack.vim'

" Add plugins to &runtimepath
call plug#end()

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

" Hide terminal buffers instead of closing them and terminating the process
autocmd TermOpen * set bufhidden=hide

" Disable escape key (use ^C instead)
inoremap <esc> <NOP>

" Replace hash rockets with Ruby 1.9-style hashes
let @h = ":s/:\\([^=,'\"]*\\) =>/\\1:/g\<C-m>"

" Show whitespace characters (tabs, trailing spaces)
set list

""""""""""""""""""""""""
" PLUGIN CONFIGURATION "
""""""""""""""""""""""""

" Run neomake on every write
autocmd! BufWritePost * Neomake

" Turn on solarized
set background=dark
colorscheme solarized

" Key mappings for fzf plugin
nmap <leader>t :FZF<CR>
nmap <leader>bb :Buffers<CR>

" Respect .gitignore in fzf
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" Make ack.vim use ag instead
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Shortcut for Ack!
nmap <leader>f :Ack!<space>

" Modify ack.vim mappings
let g:ack_mappings = {
  \ "t": "<C-W><CR><C-W>T",
  \ "T": "<C-W><CR><C-W>TgT<C-W>j",
  \ "o": "<CR>",
  \ "O": "<CR><C-W><C-W>:ccl<CR>",
  \ "go": "<CR><C-W>j",
  \ "<C-X>": "<C-W><CR><C-W>K",
  \ "H": "<C-W><CR><C-W>K<C-W>b",
  \ "<C-V>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t",
  \ "gv": "<C-W><CR><C-W>H<C-W>b<C-W>J" }
