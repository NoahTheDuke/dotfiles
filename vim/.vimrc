" Table of Contents
" =================

" * Settings that must be set before plugins are loaded
" * [Plugins](#plugins)
" * [Vim Settings](#settings)
" * [Plugin Settings](#plugin-settings)
" * [Keybinds](#keybinds)
" * [Plugin Keybinds](#plugin-keybinds)
" * [Font Defaults](#font-defaults)

" Init settings
let g:loaded_matchit = 1
let g:ale_disable_lsp = 1
let g:polyglot_disabled = ['autoindent', 'csv']

" Plugins
" =======

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')

" Be sensible
Plug 'https://github.com/tpope/vim-sensible.git'

" core functionality
Plug 'https://github.com/qpkorr/vim-bufkill.git'
Plug 'https://github.com/ReekenX/vim-rename2.git'
Plug 'https://github.com/vimwiki/vimwiki', { 'branch': 'dev' }

" Buffer/status line
Plug 'https://github.com/bling/vim-airline.git'
" Plug 'https://github.com/bling/vim-airline.git', Cond(!has('nvim'))
" Plug 'https://github.com/kyazdani42/nvim-web-devicons.git', Cond(has('nvim'))
" Plug 'https://github.com/akinsho/bufferline.nvim.git', Cond(has('nvim'))
" Plug 'https://github.com/hoob3rt/lualine.nvim.git', Cond(has('nvim'))

" visual/display
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/osyo-manga/vim-over.git'
Plug 'https://github.com/ruanyl/vim-gh-line.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/tpope/vim-rhubarb.git'

" directory display/movement
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/lambdalisue/fern.vim.git'
Plug 'https://github.com/previm/previm.git', {'for': 'markdown'}

" in-file editing
Plug 'https://github.com/AndrewRadev/splitjoin.vim.git'
Plug 'https://github.com/AndrewRadev/switch.vim.git'
Plug 'https://github.com/guns/vim-sexp.git'
Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tpope/vim-sexp-mappings-for-regular-people.git'
Plug 'https://github.com/tpope/vim-speeddating.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/wellle/targets.vim.git'

" movement
Plug 'https://github.com/andymass/vim-matchup.git'
Plug 'https://github.com/jremmen/vim-ripgrep.git'
Plug 'https://github.com/wfxr/minimap.vim.git', {'do': ':!cargo install --locked code-minimap'}

" general programming editing
Plug 'https://github.com/conormcd/matchindent.vim'
Plug 'https://github.com/godlygeek/tabular.git'
Plug 'https://github.com/janko-m/vim-test.git'
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/tpope/vim-projectionist.git'
Plug 'https://github.com/w0rp/ale.git'

" tools for specific programming languages
Plug 'https://github.com/bakpakin/fennel.vim.git'
Plug 'https://github.com/guns/vim-sexp.git', {'for': 'clojure'}
Plug 'https://github.com/lumiliet/vim-twig.git'
Plug 'https://github.com/NoahTheDuke/vim-just.git', {'for': 'just'}
Plug 'https://github.com/plasticboy/vim-markdown.git', {'for': 'markdown'}
Plug 'https://github.com/psf/black.git', {'for': 'python'}
Plug 'https://github.com/rust-lang/rust.vim.git', {'for': 'rust'}
Plug 'https://github.com/samsaga2/vim-z80', {'for': 'asm'}
Plug 'https://github.com/sheerun/vim-polyglot.git'
Plug 'https://github.com/tpope/vim-rails.git', {'for': 'ruby'}
Plug 'https://github.com/vlime/vlime.git', {'rtp': 'vim/', 'for': 'lisp'}

" iced for vim8
Plug 'https://github.com/liquidz/vim-iced.git', Cond(!has('nvim'), {'for': 'clojure'})
" conjure for nvim
Plug 'https://github.com/Olical/conjure.git', Cond(has('nvim'), {'tag': 'v4.23.0'})
Plug 'https://github.com/walterl/conjure-macroexpand.git', Cond(has('nvim'))

" colors
Plug 'https://github.com/dracula/vim.git', {'as': 'dracula-vim'}

call plug#end()

" Vim Settings
" ============

" necessary internal changes
" set clipboard+=unnamedplus  " Unix only
" set clipboard+=unnamed  " Windows only
set clipboard=unnamed  " Mac only
set encoding=utf-8  " Supposed to be set by vim-sensible, but isn't always set.
scriptencoding utf-8
set formatoptions=tqrn1
set guioptions=grtC
set modelines=0
set textwidth=88
set cmdheight=2
set shortmess+=c
set signcolumn=number
set updatetime=300
set wildignorecase

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" cwd, save, reload
set autochdir

augroup autosave
    autocmd FocusLost * :wa
augroup END

" filetypes
augroup filetypes
  autocmd Filetype gitcommit setlocal spell textwidth=80
  autocmd BufNewFile,BufReadPost *.axvw set filetype=xml
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  autocmd BufNewFile,BufReadPost *.asd set filetype=lisp
  autocmd BufNewFile,BufReadPost *.asm set filetype=z80
augroup END

" searching
set incsearch
set hlsearch
set showmatch

" tabs
set shiftwidth=4
set tabstop=4
set expandtab
set nosmartindent
set softtabstop=-1

" what to display
set title
set noshowmode
set noerrorbells
set visualbell
set colorcolumn=88
set showcmd

" Relative and current line numbers
set number

" Store backup and undo files in fixed location, not current directory.
set noswapfile
set backup
set backupdir=~/.vim/backupfiles
set undofile
set undodir=~/.vim/undofiles

set list
set listchars=tab:>\ ,eol:¬,trail:~

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10

set wildignore+=*\\tmp\\*,*\\target\\*,*\\out\\*

" Plugin and Language Settings
" ===============
" colors
color dracula

function! ShowColourSchemeName()
  return get(g:, 'colors_name', 'default')
endfunction

function! SetDraculaColors()
    if ShowColourSchemeName() ==? 'dracula'
        hi! link Macro DraculaOrange
        hi! link Operator DraculaOrange
    endif
endfunction

augroup MyColors
    call SetDraculaColors()

    hi! link SpecialKey Comment
    hi! link typescriptFunctionCall Function
    hi! link typescriptFunctionMember Function
    hi! link typescriptKeywordOp Operator
    hi! link typescriptMember Function
    hi! link typescriptOperator Operator
augroup END

" airline settings
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_highlighting_cache = 1
" top line is default, other lines are additions
let g:airline#extensions#c_like_langs =
    \ [
    \   'arduino', 'c', 'cpp', 'cuda', 'go', 'javascript', 'ld', 'php',
    \   'typescript'
    \ ]

" ALE settings
let g:ale_completion_enabled = 0
let g:ale_set_balloons = 0
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 200
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {
    \ 'clojure': [''],
    \ 'java': [''],
    \ 'javascript': ['eslint'],
    \ 'markdown': [''],
    \ 'python': ['flake8'],
    \ 'ruby': ['rubocop']
    \ }
let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
    \ 'ruby': ['rubocop']
    \ }
let g:ale_linters_ignore = ['markdownlint']

" Clojure settings
let g:clojure_syntax_keywords = {
    \ 'clojureMacro':
    \   ['effect', 'req', 'msg', 'wait-for', 'continue-ability',
    \    'do-game', 'deftest-pending', 'changes-val-macro',
    \    'when-let*', 'before-each']
    \ }

augroup clojure
  autocmd FileType clojure setlocal lispwords+=before-each,do-game
augroup END

" polyglot/language settings
let g:python_highlight_all = 1
let java_highlight_functions = 1
let javascript_plugin_flow = 1
let g:typescript_ignore_browserwords = 1

" jedi-vim settings
let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled = 0

" vim markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = [
      \ 'clojure=clojure',
      \ 'clj=clojure',
      \ 'clojurescript=clojurescript',
      \ 'cljs=clojurescript',
      \ ]

augroup asciidoc
  autocmd FileType asciidoc setlocal textwidth=0
augroup END

" ctrlp settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '/target/',
  \ }
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 1000

" from: https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html
let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
let g:ctrlp_use_caching = 0

" vim-test settings
let test#strategy = 'dispatch'
let test#ruby#minitest#options = '--no-color'

" Splitjoin
" nmap sj :SplitjoinSplit<CR>
" nmap sk :SplitjoinJoin<CR>
let g:splitjoin_trailing_comma = 1

" switch.vim
augroup switches
  autocmd FileType lisp let b:switch_custom_definitions =
        \ [
        \   {
        \     '"\(\k\+\)"': '''\1',
        \     '''\(\k\+\)': ':\1',
        \     ':\(\k\+\)': '#:\1',
        \     '#:\(\k\+\)':  '"\1"\2',
        \   },
        \ ]
augroup END

" minimap.vim settings
let g:minimap_highlight_range=1

" vimwiki
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{
  \ 'path': '~/dotfiles/vimwiki/',
  \ 'template_path': '~/dotfiles/vimwiki/templates/',
  \ 'template_default': 'default',
  \ 'path_html': '~/vimwiki/site_html/',
  \ 'template_ext': '.tpl'
  \ }]

" coc.nvim
let g:coc_default_semantic_highlight_groups = 0
let g:node_client_debug = 1
" let g:coc_node_args = ['--nolazy', '--inspect=6045']

" csv.vim
let g:csv_nomap_bs = 1
let g:csv_nomap_cr = 1
let g:csv_nomap_space = 1

" minimap
let g:minimap_width = 10
let g:minimap_git_colors = 1

" Keybinds
" ========

" * jj  -> Escape: Classic input mode remap, for speed and no hand-movement.
" * F1  -> Escape: Obvious, but extremely helpful when the hand misses.
" * Q   -> nop:    I don't use Ex/Command mode, and I hit this a lot on accident. GONE.
" * Y   -> y$:     Now matches the other capital letter commands: D, C, etc.
" * V   -> v$:     Now matches the other capital letter commands: D, C, etc.
" * #   -> #:      All this does is enter a single letter (X), delete the letter, and reenter the comment character.
"                  This fixes an issue with smartindent.
" * Ctrl-a/Ctrl-x: Within a visual selection, increments or decrements the first number on each line selected.

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap Q <nop>
inoremap jj <ESC>
nnoremap Y y$
nnoremap vv V
nnoremap V <C-V>$
vnoremap <C-a> :s/\%V-\=\d\+/\=submatch(0)+1/g
vnoremap <C-x> :s/\%V-\=\d\+/\=submatch(0)-1/g

" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" Python comment indentation fix
inoremap # X<BS>#

" Identify syntax highlighting under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Plugin Keybinds
" ---------------

" * ga -> EasyAlign: Activates EasyAlign in visual mode and for a motion/text object.
" * F5 -> Toggles undotree.
" * F6 -> Toggles Fern
" * F7 -> Toggles Minimap

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap <F5> :UndotreeToggle<CR>
nmap <F6> :Fern . -drawer -toggle<CR>
nmap <F7> :MinimapToggle<CR>

let g:previm_open_cmd = 'open -a Firefox'

if has('nvim')
  source ~/dotfiles/vim/conjure.vim
else
  source ~/dotfiles/vim/vim-iced.vim
endif
source ~/dotfiles/vim/coc-nvim.vim

" Font Defaults
" =============

"Set the font and size
if has('gui_running')
  set mouse=a

  if has('gui_gtk2')
    set guifont=FiraCode-Light\ 14
  elseif has('gui_win32')
   set guifont=FiraCode-Light:h14
  elseif has('gui_macvim')
    set guifont=FiraCode-Light:h14
    set macligatures
  else
    set guifont=FiraCode-Light:h14
  endif
endif