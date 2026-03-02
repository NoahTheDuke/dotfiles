-- [nfnl] fnl/noahtheduke/plugins/wilder.fnl
local utils = require("noahtheduke.utils")
local function _1_()
  local errors_2_ = {}
  local _3_, wilder
  local function _4_()
    return require("wilder")
  end
  local function _5_(err_1_auto)
    return table.insert(errors_2_, debug.traceback(err_1_auto))
  end
  _3_, wilder = xpcall(_4_, _5_)
  if _3_ then
    return wilder.setup({modes = {":", "/", "?"}})
  else
    return vim.notify(errors_2_[1], vim.log.levels.ERROR)
  end
end
return {utils.dep("https://github.com/gelguy/wilder.nvim", {config = _1_})}
