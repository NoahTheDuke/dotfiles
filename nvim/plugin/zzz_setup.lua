-- [nfnl] plugin/zzz_setup.fnl
local errors_1_ = {}
local _2_, alpha
local function _3_()
  return require("noahtheduke.plugins.alpha")
end
local function _4_(err_1_auto)
  return table.insert(errors_1_, debug.traceback(err_1_auto))
end
_2_, alpha = xpcall(_3_, _4_)
if _2_ then
  return alpha.config(nil, nil, true)
else
  return vim.notify(errors_1_[1], vim.log.levels.ERROR)
end
