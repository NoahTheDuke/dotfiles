-- [nfnl] plugin/zzz_setup.fnl
local errors_1_ = {}
local _2_, alpha
local function _3_()
  return require("noahtheduke.plugins.alpha")
end
local function _4_(err_2_auto)
  if (nil == err_2_auto) then
    _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/plugin/zzz_setup.fnl:3", 2)
  else
  end
  return table.insert(errors_1_, debug.traceback(err_2_auto))
end
_2_, alpha = xpcall(_3_, _4_)
if _2_ then
  return alpha.config(nil, nil, true)
else
  return vim.notify(errors_1_[1], vim.log.levels.ERROR)
end
