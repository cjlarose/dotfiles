"" General
set number	        " Show line numbers
set visualbell	        " Use visual bell (no beeping)
 
set hlsearch	        " Highlight all search results
set smartcase	        " Enable smart-case search
set ignorecase	        " Always case-insensitive
set incsearch	        " Searches for strings incrementally
 
set autoindent	        " Auto-indent new lines
set expandtab	        " Use spaces instead of tabs
set shiftwidth=2	" Number of auto-indent spaces
set smartindent	        " Enable smart-indent
set smarttab	        " Enable smart-tabs
set softtabstop=2	" Number of spaces per Tab

syntax enable           " Enable syntax highlighting
set background=dark

" Solarized options
set t_Co=256
colorscheme solarized
 
set ruler	        " Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
 
set colorcolumn=80      " Colored line at 80-chars

set relativenumber      " Enabling both relative number and number turns on hybrid mode
set number

" Reload .vimrc while editing
" http://superuser.com/a/417997
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

autocmd FileType make setlocal noexpandtab " Tabs in makefiles
