-- [nfnl] nvim/fnl/plugins/jj-nvim.fnl
local utils = require("utils")
local function config()
  local errors_1_ = {}
  local _2_, jj
  local function _3_()
    return require("jj")
  end
  local function _4_(err_1_auto)
    return table.insert(errors_1_, debug.traceback(err_1_auto))
  end
  _2_, jj = xpcall(_3_, _4_)
  if _2_ then
    return jj.setup({})
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/NicolasGB/jj.nvim", {config = config})}
