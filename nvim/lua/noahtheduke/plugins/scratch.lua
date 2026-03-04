-- [nfnl] fnl/noahtheduke/plugins/scratch.fnl
local utils = require("noahtheduke.utils")
local function _1_()
  local errors_2_ = {}
  local _3_, scratch
  local function _4_()
    return require("scratch")
  end
  local function _5_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/scratch.fnl:9", 2)
    else
    end
    return table.insert(errors_2_, debug.traceback(err_2_auto))
  end
  _3_, scratch = xpcall(_4_, _5_)
  if _3_ then
    return scratch.setup({use_telescope = true, file_picker = "telescope", filetypes = {"clj", "lua", "js", "md", "sh", "ts", "txt"}})
  else
    return vim.notify(errors_2_[1], vim.log.levels.ERROR)
  end
end
return {utils.dep("https://github.com/ibhagwan/fzf-lua"), utils.dep("https://github.com/LintaoAmons/scratch.nvim", {config = _1_})}
