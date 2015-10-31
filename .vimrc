" nocompatible is a must, as is utf-8
set nocompatible
set encoding=utf-8
set clipboard+=unnamed
set paste
filetype off                   " required!

set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/')

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
"Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'osyo-manga/vim-over'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'Rename2'
Plugin 'dag/vim2hs'
Plugin 'w0ng/vim-hybrid'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim'}

call vundle#end()
filetype plugin indent on     " required!

cabbrev %s OverCommandLine<cr>%s
au FileType python setlocal completeopt-=preview
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_enable_signs = 0
let g:syntastic_python_pep8_args = '--ignore=E125,E501'

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

set undofile
set nobackup
set noswapfile
set number
set relativenumber
set autoread

set wrap
set textwidth=89
set formatoptions=qrn1
"set foldmethod=indent

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
au FileType python nnoremap <F9> :exec '!python' shellescape(@%, 1)<cr>

au FocusLost * :wa
highlight texBoldStyle gui=none
highlight texItalStyle gui=none
highlight texBoldItalStyle gui=none
highlight texItalBoldStyle gui=none

let g:hybrid_use_Xresources = 1
let g:haskell_conceal = 0
"colorscheme hybrid
color Dracula
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
cd C:\Users\Noah
