" Table of Contents
" =================

" * [Plugins](#plugins)
" * [Vim Settings](#settings)
" * [Plugin Settings](#plugin-settings)
" * [Keybinds](#keybinds)
" * [Plugin Keybinds](#plugin-keybinds)
" * [Font Defaults](#font-defaults)

" Plugins
" =======

let g:loaded_matchit = 1

call plug#begin('~/.vim/plugged')

" Be sensible
Plug 'https://github.com/tpope/vim-sensible.git'

" core functionality
Plug 'https://github.com/qpkorr/vim-bufkill.git'
Plug 'https://github.com/ReekenX/vim-rename2.git'
Plug 'https://github.com/vimwiki/vimwiki', { 'branch': 'dev' }

" visual/display
Plug 'https://github.com/bling/vim-airline.git'
Plug 'https://github.com/mbbill/undotree.git'
Plug 'https://github.com/osyo-manga/vim-over.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/ruanyl/vim-gh-line.git'

" directory display/movement
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/scrooloose/nerdtree.git'

" in-file editing
Plug 'https://github.com/AndrewRadev/splitjoin.vim.git'
Plug 'https://github.com/AndrewRadev/switch.vim.git'
" Plug 'https://github.com/guns/vim-sexp.git'
Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'https://github.com/tpope/vim-bundler.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/tpope/vim-endwise.git'
Plug 'https://github.com/tpope/vim-repeat.git'
" Plug 'https://github.com/tpope/vim-sexp-mappings-for-regular-people.git'
Plug 'https://github.com/tpope/vim-speeddating.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-unimpaired.git'
Plug 'https://github.com/wellle/targets.vim.git'

" movement
Plug 'https://github.com/andymass/vim-matchup.git'
Plug 'https://github.com/easymotion/vim-easymotion.git'
Plug 'https://github.com/jremmen/vim-ripgrep.git'

" general programming editing
Plug 'https://github.com/tpope/vim-dispatch.git'
Plug 'https://github.com/tpope/vim-projectionist.git'
Plug 'https://github.com/tpope/vim-sleuth.git'
Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/janko-m/vim-test.git'
Plug 'https://github.com/Shougo/deoplete.nvim.git'
Plug 'https://github.com/roxma/nvim-yarp.git'
Plug 'https://github.com/roxma/vim-hug-neovim-rpc.git'
Plug 'https://github.com/wokalski/autocomplete-flow.git'
" Plug 'https://github.com/ludovicchabant/vim-gutentags.git'

" tools for specific programming languages
Plug 'https://github.com/sheerun/vim-polyglot.git'
Plug 'https://github.com/ambv/black.git', { 'for': 'python' }
Plug 'https://github.com/davidhalter/jedi-vim.git', { 'for': 'python' }
Plug 'https://github.com/plasticboy/vim-markdown.git'
Plug 'https://github.com/rust-lang/rust.vim.git'
Plug 'https://github.com/tpope/vim-fireplace.git', { 'for': 'clojure' }
Plug 'https://github.com/tpope/vim-rails.git', { 'for': 'ruby' }
Plug 'https://github.com/tpope/vim-salve.git', { 'for': 'clojure' }
Plug 'https://github.com/lumiliet/vim-twig.git'

" colors
Plug 'git@github.com:noahtheduke/dracula-vim.git'
Plug 'https://github.com/agudulin/vim-colors-alabaster.git'

call plug#end()

" Vim Settings
" ============

" necessary internal changes
" set clipboard+=unnamedplus  " Unix only
set clipboard+=unnamed  " Windows only
" set clipboard=unnamed  " Mac only
set encoding=utf-8  " Supposed to be set by vim-sensible, but isn't always set.
set formatoptions=tqrn1
set guioptions=grtC
set modelines=0
set tw=88

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" cwd, save, reload
set autochdir
au FocusLost * :wa

" filetypes
autocmd Filetype gitcommit setlocal spell textwidth=80
au BufNewFile,BufReadPost *.axvw set filetype=xml
au BufNewFile,BufReadPost *.md set filetype=markdown

" searching
set hlsearch
set showmatch

" tabs
set shiftwidth=4
set expandtab
set nosmartindent
set softtabstop=-1

" what to display
set title
set noshowmode
set noerrorbells
set visualbell
set cc=88
set showcmd

" Disable hover tooltips
set noballooneval
let g:netrw_nobeval=1

" Relative and current line numbers
set number

" Store backup and undo files in fixed location, not current directory.
set noswapfile
set backup
set backupdir=~/.vim/backupfiles
set undofile
set undodir=~/.vim/undofiles

set list
set lcs=tab:>\ ,eol:¬,trail:~

" netrw settings
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10

set wildignore+=*\\tmp\\*,*\\target\\*,*\\out\\*

" ebth-specific
set includeexpr=substitute(v:fname,'^\\~\/','~/dev/ebth-com/app/javascript/','')
set suffixesadd=.js,.md

" Plugin and Language Settings
" ===============

" colors, etc
color dracula

" airline settings
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_highlighting_cache = 1
let g:airline_powerline_fonts = 1

" ALE settings
let g:ale_completion_enabled = 1
let g:ale_set_balloons=0
let g:ale_sign_column_always = 1
let g:ale_lint_delay = 200
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_linters = {
    \ 'java': [''],
    \ 'javascript': ['flow', 'eslint'],
    \ 'python': ['flake8'],
    \ 'ruby': ['rubocop']
    \ }
let g:ale_fixers = {
    \ 'javascript': ['prettier'],
    \ 'ruby': ['rubocop']
    \ }

let g:ale_javascript_prettier_options = '--single-quote --print-width 88 --tab-width 4'

" Clojure settings
let g:clojure_syntax_keywords = {
    \ 'clojureMacro':
    \   ["effect", "req", "msg", "wait-for", "continue-ability",
    \    "rename", "do-game", "deftest-pending", "changes-val-macro",
    \    "when-let*"]
    \ }
" Indent awareness without limits
let g:clojure_maxlines = 250

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

" Tagbar
" let g:tagbar_ctags_bin = 'C:\Users\NoahBogart\Personal\bin\ctags\ctags.exe'
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" NERDTree
autocmd vimenter * NERDTree

" polyglot settings
let python_highlight_all = 1
let java_highlight_functions = 1
let g:javascript_plugin_flow = 1


" jedi-vim settings
let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled = 0
autocmd FileType python setlocal completeopt-=preview

" vim markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

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
let test#strategy = "dispatch"
let test#ruby#minitest#options = '--no-color'
let test#clojure#fireplacetest#executable = 'lein eftest'

" Splitjoin
nmap sj :SplitjoinSplit<CR>
nmap sk :SplitjoinJoin<CR>
let g:splitjoin_trailing_comma = 1

" Sadly, these next bits have to be hardcoded, because I haven't put in the effort to learn enough vimscript to write
" a function that would accomplish the same thing. However, I spend all my time at a single workstation, so this isn't too
" much of a hassle. In the future, I will have to put in that effort, which is v sad.

" spacing the sidebars correctly for 88 text width
let g:NERDTree = 27
let g:tagbar_width = 27

" And here are my Vimwiki settings, which are vast and elaborate because vimwiki is vast
" and elaborate.

let g:vimwiki_list = [{
  \ 'path': '~/dotfiles/vimwiki/',
  \ 'template_path': '~/dotfiles/vimwiki/templates/',
  \ 'template_default': 'default',
  \ 'path_html': '~/vimwiki/site_html/',
  \ 'template_ext': '.tpl'
  \ }]

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

" Python comment indentation fix
inoremap # X<BS>#

" Identify syntax highlighting under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Plugin Keybinds
" ---------------

" * %s -> OverCommandLine: When writing a regex, if it's a regex over the whole file, instead activate OverCommandLine to
"     see the changes as they're typed.
" * ga -> EasyAlign:       Activates EasyAlign in visual mode and for a motion/text object.
" * \\w, \\W -> EasyMotion: Changes the EasyMotion default of searching forward per word to searching the whole file per
"     word.
" * F5 -> Toggles undotree.

cabbrev %s OverCommandLine<cr>%s

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

nmap \\w <Plug>(easymotion-bd-w)
nmap \\W <Plug>(easymotion-bd-W)

nmap <F5> :UndotreeToggle<CR>
nmap <F6> :NERDTreeToggle<CR>

" Font Defaults
" =============

"Set the font and size
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 13
  elseif has("gui_win32")
   set guifont=Consolas:h11
  else
    set macligatures
    set guifont=FiraCode-Light:h13
    set mouse=a
  endif
endif
