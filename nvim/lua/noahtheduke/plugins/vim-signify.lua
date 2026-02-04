-- [nfnl] fnl/noahtheduke/plugins/vim-signify.fnl
local utils = require("noahtheduke.utils")
local function config()
  vim.g.signify_skip = {vcs = {allow = {"git"}}}
  return nil
end
--[[ (config) ]]
return {utils.dep("https://github.com/mhinz/vim-signify", {config = config, branch = "master"})}
