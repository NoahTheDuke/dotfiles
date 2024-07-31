-- [nfnl] Compiled from fnl/plugins/scratch.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local scratch = require("scratch")
  return scratch.setup({filetypes = {"clj", "lua", "js", "sh", "ts"}})
end
return {utils.dep("https://github.com/LintaoAmons/scratch.nvim", {config = _1_})}
