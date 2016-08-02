" nocompatible is a must, as is utf-8
set nocompatible
set encoding=utf-8
set clipboard+=unnamedplus
set paste

call plug#begin('~/.vim/plugged')

Plug 'Rename2'
Plug 'bling/vim-airline'
Plug 'dag/vim2hs'
Plug 'justinmk/vim-sneak'
Plug 'osyo-manga/vim-over'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'dracula/vim'

call plug#end()

cabbrev %s OverCommandLine<cr>%s
au FileType python setlocal completeopt-=preview
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_python_checkers = ['flake8']
let g:polyglot_disabled = ['python']
let g:syntastic_python_flake8_args='--ignore=E501'

set modelines=0
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set showmatch
set hlsearch
set incsearch
set laststatus=2
set noshowmode
set autochdir
set display+=lastline
syntax on

set title
set visualbell
set noerrorbells

set number
set relativenumber
set autoread

set wrap
set textwidth=80
set formatoptions=qrn1

" Store swap files in fixed location, not current directory.
set undofile
set backup
set backupdir=~/.vim/backupfiles
set undodir=~/.vim/undofiles
set dir=~/.vim/swapfiles

" Key bindings and maps
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap Q <nop>
inoremap jj <ESC>
inoremap # X<BS>#
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %
nnoremap Y y$

au FocusLost * :wa
highlight texBoldStyle gui=NONE
highlight texItalStyle gui=NONE
highlight texBoldItalStyle gui=NONE
highlight texItalBoldStyle gui=NONE

let g:hybrid_use_Xresources = 1
let g:haskell_conceal = 0
color dracula

""""""""""""""
" Functions! "
""""""""""""""
"Set the font and size
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 11
  elseif has("gui_win32")
    set guifont=Consolas:h11
  endif
endif
