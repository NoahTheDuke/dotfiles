-- [nfnl] fnl/noahtheduke/plugins/url-open.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, url_open
  local function _4_()
    return require("url-open")
  end
  local function _5_(err_1_auto)
    return table.insert(errors_1_, debug.traceback(err_1_auto))
  end
  _2_, url_open = xpcall(_4_, _5_)
  local _3_, handlers
  local function _6_()
    return require("url-open.modules.handlers")
  end
  local function _7_(err_1_auto)
    return table.insert(errors_1_, debug.traceback(err_1_auto))
  end
  _3_, handlers = xpcall(_6_, _7_)
  if (_2_ and _3_) then
    local opts = {highlight_url = {all_urls = {enabled = false}, cursor_move = {enabled = false}}, open_only_when_cursor_on_url = false}
    url_open.setup(opts)
    local function _8_()
      return handlers.open_url(opts)
    end
    return vim.api.nvim_create_user_command("OpenUrlUnderCursor", _8_, {nargs = 0})
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/sontungexpt/url-open", {cmd = {"OpenUrlUnderCursor", "URLOpenUnderCursor"}, config = config})
