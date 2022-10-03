-- vim.cmd [[
--   set runtimepath^=$HOME/personal/coc-clojure
--   set runtimepath^=$HOME/personal/coc.nvim
--   source $HOME/dotfiles/nvim/coc-nvim.vim
--   let $NVIM_COC_LOG_LEVEL='debug'
--   let $NVIM_COC_LOG_FILE = '/tmp/coc-nvim.log'
--   let g:coc_node_args = ['-r', expand('~/.config/yarn/global/node_modules/source-map-support/register')]
-- ]]

require "options"
require "keymaps"
require "colorscheme"
require "autocmds"
require "plugins"
