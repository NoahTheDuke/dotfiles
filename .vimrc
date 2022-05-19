" debug/light vimrc settings
" set nocompatible
" set encoding=utf-8
" scriptencoding utf-8
" filetype plugin indent on
"
" set runtimepath-=$HOME/.vim
" set runtimepath-=$HOME/.vim/after
" set runtimepath-=$HOME/.config/nvim
" set runtimepath-=$HOME/.config/nvim/after
" set runtimepath-=$HOME/.local/share/nvim/site
" set runtimepath-=$HOME/.local/share/nvim/site/after
"
" let g:node_client_debug = 1
" let $NVIM_COC_LOG_LEVEL='debug'
" let $NVIM_COC_LOG_FILE = '/tmp/coc-nvim.log'
" let g:coc_node_args = ['-r', expand('~/.config/yarn/global/node_modules/source-map-support/register')]
" set runtimepath^=$HOME/Personal/coc.nvim
set runtimepath^=$HOME/Personal/coc-clojure

" neovim-qt settings are loaded automatically, so this is a link for ease of access
" ~/.config/nvim/ginit.vim
"
set background=light
set clipboard+=unnamedplus
source ~/dotfiles/vim/.vimrc
" source ~/dotfiles/vim/conjure.vim
" source ~/dotfiles/vim/coc-nvim.vim
set cc=80
