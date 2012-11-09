
" nocompatible is a must, as is utf-8
set nocompatible
set encoding=utf-8

set modelines=0
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
syntax on

set title
set visualbell
set noerrorbells

set nobackup
set noswapfile
set relativenumber
set undofile

set wrap
set textwidth=79
set formatoptions=qrn1

" Key bindings and maps
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap jj <ESC>
let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

au FocusLost * :wa

colorscheme desert

""""""""""""""
" Functions! "
""""""""""""""

" Set the font and size
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 11
  elseif has("gui_win32")
    set guifont=Consolas:h11
  endif
endif

map <C-n> :call ToggleNumbers()<CR>
let b:numbered = 1 
function! ToggleNumbers() 
  if( b:numbered == 0 ) 
      set relativenumber
      let b:numbered = 1 
  else 
      set number
      let b:numbered = 0 
  endif 
endfunction 