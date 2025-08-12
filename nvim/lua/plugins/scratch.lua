-- [nfnl] nvim/fnl/plugins/scratch.fnl
local utils = require("utils")
local function _1_()
  local scratch = require("scratch")
  return scratch.setup({filetypes = {"clj", "lua", "js", "md", "sh", "ts", "txt"}})
end
return {utils.dep("https://github.com/LintaoAmons/scratch.nvim", {cmd = {"Scratch", "ScratchOpen", "ScratchWithName"}, config = _1_})}
