-- [nfnl] fnl/noahtheduke/plugins/blink-cmp.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, blink
  local function _3_()
    return require("blink.cmp")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/blink-cmp.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, blink = xpcall(_3_, _4_)
  if _2_ then
    return blink.setup({keymap = {preset = "default"}, cmdline = {enabled = false}, completion = {list = {selection = {preselect = false}}, menu = {auto_show = true}}})
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/saghen/blink.cmp", {config = config})
