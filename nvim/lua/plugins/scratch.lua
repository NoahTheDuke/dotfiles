-- [nfnl] nvim/fnl/plugins/scratch.fnl
local utils = require("utils")
local function _1_()
  local _2_, scratch = pcall(require, "scratch")
  if _2_ then
    return scratch.setup({filetypes = {"clj", "lua", "js", "md", "sh", "ts", "txt"}})
  else
    return nil
  end
end
return {utils.dep("https://github.com/LintaoAmons/scratch.nvim", {cmd = {"Scratch", "ScratchOpen", "ScratchWithName"}, config = _1_})}
