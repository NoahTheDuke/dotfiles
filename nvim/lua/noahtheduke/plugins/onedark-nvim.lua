-- [nfnl] fnl/noahtheduke/plugins/onedark-nvim.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, onedark
  local function _3_()
    return require("onedark")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/onedark-nvim.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, onedark = xpcall(_3_, _4_)
  if _2_ then
    onedark.setup({style = "light"})
    return onedark.load()
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
return {utils.colorscheme("https://github.com/navarasu/onedark.nvim", {config = config})}
