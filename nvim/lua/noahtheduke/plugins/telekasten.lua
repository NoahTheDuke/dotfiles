-- [nfnl] fnl/noahtheduke/plugins/telekasten.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, telekasten
  local function _3_()
    return require("telekasten")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/telekasten.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, telekasten = xpcall(_3_, _4_)
  if _2_ then
    return telekasten.setup({home = vim.fn.expand("~/personal/telekasten")})
  elseif next(errors_1_) then
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  else
    return nil
  end
end
return {utils.dep("https://github.com/nvim-telekasten/calendar-vim"), utils.dep("https://github.com/nvim-telekasten/telekasten.nvim", {config = config})}
