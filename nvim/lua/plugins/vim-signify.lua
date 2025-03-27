-- [nfnl] Compiled from fnl/plugins/vim-signify.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function config()
  vim.g.signify_skip = {vcs = {allow = {"git"}}}
  return nil
end
--[[ (config) ]]
return {utils.dep("https://github.com/mhinz/vim-signify", {config = config})}
