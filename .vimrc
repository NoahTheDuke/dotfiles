call plug#begin('~/.vim/plugged')

" general
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'osyo-manga/vim-over'
Plug 'ReekenX/vim-rename2'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'

" movement
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'

" programming language support
Plug 'dag/vim2hs'
Plug 'davidhalter/jedi-vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'wlangstroth/vim-racket'

" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" colors
Plug 'dracula/vim', {'as': 'dracula-vim'}

call plug#end()

" necessary internal changes
set clipboard+=unnamedplus
set modelines=0
set formatoptions=tqrn1
set guioptions+=C
set guioptions-=m
set guioptions-=T
set tw=120
autocmd Filetype gitcommit setlocal spell textwidth=80
let g:ackprg = 'rg --no-heading --vimgrep'

" colors, etc
color dracula

" airline settings
let g:airline#extensions#syntastic#enabled = 1

" polyglot settings
let g:polyglot_disabled = ['rust']
let python_highlight_all = 1

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = ['--ignore=E501,E302,E305,E402,E126']
let g:syntastic_enable_racket_racket_checker = 1
let g:syntastic_racket_checkers = ['racket']

" jedi-vim settings
let g:jedi#smart_auto_mappings = 0
autocmd FileType python setlocal completeopt-=preview

" cwd, save, reload
set autochdir
au FocusLost * :wa
" au FocusGained * :checktime " Neovim setting only
set autoread

" searching
set hlsearch
set incsearch
set showmatch

" tabs
set shiftwidth=4
set expandtab
set nosmartindent
set softtabstop=4
set tabstop=4

" what to display
set title
set noshowmode
set noerrorbells
set visualbell
set display+=lastline
set laststatus=2
set cc=120

" Relative and current line numbers
set number
set relativenumber

" Store swap files in fixed location, not current directory.
set undofile
set backup
set backupdir=~/.vim/backupfiles
set undodir=~/.vim/undofiles
set dir=~/.vim/swapfiles

set list
set lcs=eol:¬,tab:>\ ,trail:~

" Key bindings and maps
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap Q <nop>
inoremap jj <ESC>
inoremap # X<BS>#
nnoremap <tab> %
vnoremap <tab> %
nnoremap Y y$
cabbrev %s OverCommandLine<cr>%s
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
vnoremap <C-a> :s/\%V-\=\d\+/\=submatch(0)+1/g
vnoremap <C-x> :s/\%V-\=\d\+/\=submatch(0)-1/g
command Rg Ack

"Set the font and size
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 13
  elseif has("gui_win32")
    set guifont=Consolas:h11
  endif
endif
