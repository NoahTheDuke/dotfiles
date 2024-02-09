-- [nfnl] Compiled from fnl/plugins/scratch.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  vim.api.nvim_create_user_command("Scratch", "<cmd>Scratch<cr>", {nargs = 0})
  vim.api.nvim_create_user_command("ScratchWithName", "<cmd>ScratchWithName<cr>", {nargs = 0})
  return vim.api.nvim_create_user_command("ScratchOpen", "<cmd>ScratchOpen<cr>", {nargs = 0})
end
return {utils.dep("https://github.com/LintaoAmons/scratch.nvim", {config = _1_})}
