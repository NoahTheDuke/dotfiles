-- [nfnl] nvim/fnl/plugins/scratch.fnl
local utils = require("utils")
local function _1_()
  local errors_2_ = {}
  local _3_, scratch
  local function _4_()
    return require("scratch")
  end
  local function _5_(err_1_auto)
    return table.insert(errors_2_, debug.traceback(err_1_auto))
  end
  _3_, scratch = xpcall(_4_, _5_)
  if _3_ then
    return scratch.setup({filetypes = {"clj", "lua", "js", "md", "sh", "ts", "txt"}})
  else
    return vim.notify(errors_2_[1], vim.log.levels.ERROR)
  end
end
return {utils.dep("https://github.com/LintaoAmons/scratch.nvim", {cmd = {"Scratch", "ScratchOpen", "ScratchWithName"}, config = _1_})}
