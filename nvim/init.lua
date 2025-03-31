-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
  end
end
vim.opt.rtp:prepend(lazypath)

-- vim.cmd [[
--   set runtimepath^=$HOME/personal/coc.nvim
--   let g:coc_node_args = ['-r', expand('~/.local/lib/node_modules/source-map-support/register')]
-- ]]

require "options"
require "keymaps"
require "autocmds"
require "lazy-setup"
require "statusline"

vim.hl = vim.highlight
vim.cmd [[let g:python3_host_prog = $HOME . "/.local/venv/nvim/bin/python"]]

vim.cmd [[
set runtimepath^=$HOME/personal/coc-clojure
let $NVIM_COC_LOG_LEVEL='debug'
let $NVIM_COC_LOG_FILE = '/tmp/coc-nvim.log'
]]
