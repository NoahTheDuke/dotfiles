set nocompatible
set encoding=utf-8

set modelines=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set relativenumber
set undofile

let mapleader = ","
nnoremap <leader><space> :noh<cr>

nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1

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

au FocusLost * :wa

inoremap jj <ESC>

colorscheme desert
set guifont=Consolas:h12
