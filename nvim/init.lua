-- vim.cmd [[
--   set runtimepath^=$HOME/personal/coc.nvim
--   let g:coc_node_args = ['-r', expand('~/.local/lib/node_modules/source-map-support/register')]
-- ]]
require "options"
require "keymaps"
require "autocmds"
require "lazy-setup"

vim.hl = vim.highlight
vim.cmd [[let g:python3_host_prog = $HOME . "/.local/venv/nvim/bin/python"]]

vim.cmd [[
set runtimepath^=$HOME/personal/coc-clojure
let $NVIM_COC_LOG_LEVEL='debug'
let $NVIM_COC_LOG_FILE = '/tmp/coc-nvim.log'
]]
