-- [nfnl] fnl/noahtheduke/plugins/kanagawa-nvim.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, kanagawa
  local function _3_()
    return require("kanagawa")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/kanagawa-nvim.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, kanagawa = xpcall(_3_, _4_)
  if _2_ then
    return kanagawa.setup()
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
return {utils.colorscheme("https://github.com/rebelot/kanagawa.nvim", {config = config})}
