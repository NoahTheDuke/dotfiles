call plug#begin('~/vimfiles')

" general
Plug 'bling/vim-airline'
Plug 'osyo-manga/vim-over'
Plug 'Rename2'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'

" movement
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" programming language support
Plug 'dag/vim2hs'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'

" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'lambdalisue/vim-fullscreen'
Plug 'leifdenby/vim-spellcheck-toggle'

" colors
Plug 'dracula/vim'
Plug 'w0ng/vim-hybrid'

call plug#end()

" necessary internal changes
set clipboard+=unnamed
set paste

" colors, etc
set guifont=Consolas:h11
color Dracula
highlight texBoldStyle gui=NONE
highlight texItalStyle gui=NONE
highlight texBoldItalStyle gui=NONE
highlight texItalBoldStyle gui=NONE

" braceless settings
autocmd FileType python BracelessEnable +indent +highlight-cc2

" airline settings
let g:airline#extensions#syntastic#enabled = 1

" polyglot settings
let g:polyglot_disabled = ['python']

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'

" cwd, save, reload
set autochdir
au FocusLost * :wa
set autoread

" searching
set hlsearch
set incsearch
set showmatch

" tabs
set shiftwidth=4
set expandtab
set smartindent
set softtabstop=4
set tabstop=4

" what to display
set title
set noshowmode
set noerrorbells
set visualbell
set display+=lastline
set laststatus=2

" Relative and current line numbers
set number
set relativenumber

" Store swap files in fixed location, not current directory.
set undofile
set backup
set backupdir=$VIMRUNTIME\backupfiles
set undodir=$VIMRUNTIME\undofiles
set dir=$VIMRUNTIME\swapfiles

" Key bindings and maps
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap Q <nop>
inoremap jj <ESC>
nnoremap <tab> %
vnoremap <tab> %
nnoremap Y y$
cabbrev %s OverCommandLine<cr>%s