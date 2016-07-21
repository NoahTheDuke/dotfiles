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

Plugin 'tpope/vim-sensible'
Plugin 'justinmk/vim-sneak'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'osyo-manga/vim-over'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'
Plugin 'Rename2'
Plugin 'dag/vim2hs'
Plugin 'w0ng/vim-hybrid'
Plugin 'sheerun/vim-polyglot'
Plugin 'tweekmonster/braceless.vim'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim'}

call vundle#end()
filetype plugin indent on     " required!

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
set backupdir=$VIMRUNTIME\backupfiles
set undodir=$VIMRUNTIME\undofiles
set dir=$VIMRUNTIME\swapfiles

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

au FocusLost * :wa
highlight texBoldStyle gui=NONE
highlight texItalStyle gui=NONE
highlight texBoldItalStyle gui=NONE
highlight texItalBoldStyle gui=NONE

let g:hybrid_use_Xresources = 1
let g:haskell_conceal = 0
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

function! ToggleMinimap()
	if exists("s:isMini") && s:isMini == 0
		let s:isMini = 1
	else
		let s:isMini = 0
	end

	if (s:isMini == 0)
		" save current visible lines
		"let s:firstLine = line("w0")
		"let s:lastLine = line("w$")

		" resize each window
		" windo let w=winwidth(0)*12 | exe "set winwidth=" . w
		" windo let h=winheight(0)*12 | exe "set winheight=" . h

		" make font small
		set guifont=ProggySquare:h12

		" don't change window size
        let c = &columns
        let l = &lines
        exe "set columns=" . c
        exe "set lines=" . l

        "
		" highlight lines which were visible
		"let s:lines = ""
		"for i in range(s:firstLine, s:lastLine)
			"let s:lines = s:lines . "\\%" . i . "l"

			"if i < s:lastLine
				"let s:lines = s:lines . "\\|"
			"endif
		"endfor

		"exe 'match Visible /' . s:lines . '/'
		"hi Visible guibg=lightblue guifg=black term=bold
	else
		set guifont=Consolas:h11
		"hi clear Visible
	endif
endfunction

command! ToggleMinimap call ToggleMinimap()
"nnoremap m :ToggleMinimap<CR>

cd C:\Users\Noah
