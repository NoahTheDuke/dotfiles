-- [nfnl] nvim/fnl/plugins/nfnl.fnl
local utils = require("utils")
local function config()
  local errors_1_ = {}
  local _2_, nfnl
  local function _3_()
    return require("nfnl")
  end
  local function _4_(err_1_auto)
    return table.insert(errors_1_, debug.traceback(err_1_auto))
  end
  _2_, nfnl = xpcall(_3_, _4_)
  if _2_ then
    return nfnl.setup({})
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/Olical/nfnl", {ft = "fennel", commit = "fecf731e02bc51d88372c4f992fe1ef0c19c02ae", config = config})
