-- [nfnl] fnl/noahtheduke/plugins/url-open.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, url_open
  local function _5_()
    return require("url-open")
  end
  local function _6_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/url-open.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, url_open = xpcall(_5_, _6_)
  local _3_, handlers
  local function _8_()
    return require("url-open.modules.handlers")
  end
  local function _9_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/url-open.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _3_, handlers = xpcall(_8_, _9_)
  local _4_, options
  local function _11_()
    return require("url-open.modules.options")
  end
  local function _12_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/url-open.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _4_, options = xpcall(_11_, _12_)
  if (_2_ and _3_ and _4_) then
    local opts = options.apply_user_options({open_only_when_cursor_on_url = true, highlight_url = {all_urls = {enabled = false}, cursor_move = {enabled = false}}})
    url_open.setup(opts)
    local function _14_()
      return handlers.open_url(opts)
    end
    return vim.api.nvim_create_user_command("OpenUrlUnderCursor", _14_, {nargs = 0})
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/sontungexpt/url-open", {cmd = {"OpenUrlUnderCursor", "URLOpenUnderCursor"}, config = config})
