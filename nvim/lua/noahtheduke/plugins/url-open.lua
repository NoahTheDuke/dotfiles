-- [nfnl] fnl/noahtheduke/plugins/url-open.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, url_open
  local function _3_()
    return require("url-open")
  end
  local function _4_(err_1_auto)
    return table.insert(errors_1_, debug.traceback(err_1_auto))
  end
  _2_, url_open = xpcall(_3_, _4_)
  if _2_ then
    return url_open.setup({highlight_url = {all_urls = {enabled = false}, cursor_move = {enabled = false}}, open_only_when_cursor_on_url = false})
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/sontungexpt/url-open", {cmd = {"OpenUrlUnderCursor", "URLOpenUnderCursor"}, config = config})
