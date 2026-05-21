-- [nfnl] fnl/noahtheduke/plugins/gruvbox.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, gruvbox
  local function _3_()
    return require("gruvbox")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/gruvbox.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, gruvbox = xpcall(_3_, _4_)
  if _2_ then
    return gruvbox.setup()
  elseif next(errors_1_) then
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  else
    return nil
  end
end
return utils.colorscheme("https://github.com/ellisonleao/gruvbox.nvim", {config = config})
