-- [nfnl] Compiled from fnl/plugins/pile-nvim.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function config()
  local pile = require("pile")
  pile.setup()
  return vim.api.nvim_set_keymap("n", "<localleader>pt", ":PileToggle<CR>", {noremap = true, silent = true})
end
--[[ (config) ]]
return {utils.dep("https://github.com/shabaraba/pile.nvim", {dependencies = {"https://github.com/MunifTanjim/nui.nvim"}, config = config})}
