-- [nfnl] nvim/fnl/plugins/blink-cmp.fnl
local utils = require("utils")
local function config()
  local errors_1_ = {}
  local _2_, blink
  local function _3_()
    return require("blink.cmp")
  end
  local function _4_(err_1_auto)
    return table.insert(errors_1_, debug.traceback(err_1_auto))
  end
  _2_, blink = xpcall(_3_, _4_)
  if _2_ then
    local function _5_(_ctx)
      return (":" == vim.fn.getcmdtype())
    end
    return blink.setup({keymap = {preset = "default"}, cmdline = {completion = {menu = {auto_show = _5_}}, keymap = {["<CR>"] = {"accept_and_enter", "fallback"}}}, menu = {auto_show = true}})
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/saghen/blink.cmp", {config = config})
