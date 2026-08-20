-- [nfnl] fnl/noahtheduke/plugins/wilder.fnl
local utils = require("noahtheduke.utils")
local function _1_()
  local errors_2_ = {}
  local _3_, wilder
  local function _4_()
    return require("wilder")
  end
  local function _5_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/wilder.fnl:9", 2)
    else
    end
    return table.insert(errors_2_, debug.traceback(err_2_auto))
  end
  _3_, wilder = xpcall(_4_, _5_)
  if _3_ then
    wilder.setup({modes = {":", "/", "?"}})
    wilder.set_option("pipeline", {wilder.branch(wilder.cmdline_pipeline(), wilder.search_pipeline())})
    return wilder.set_option("renderer", wilder.wildmenu_renderer({highligher = wilder.basic_highlighter()}))
  elseif next(errors_2_) then
    return vim.notify(errors_2_[1], vim.log.levels.ERROR)
  else
    return nil
  end
end
return {utils.dep("https://github.com/gelguy/wilder.nvim", {config = _1_})}
