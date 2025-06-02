-- [nfnl] nvim/fnl/plugins/vim-signify.fnl
local utils = require("utils")
local function config()
  vim.g.signify_skip = {vcs = {allow = {"git"}}}
  return nil
end
--[[ (config) ]]
return {utils.dep("https://github.com/mhinz/vim-signify", {config = config})}
