-- [nfnl] nvim/fnl/plugins/url-open.fnl
local utils = require("utils")
local function config()
  local status_ok, url_open = pcall(require, "url-open")
  if status_ok then
    return url_open.setup({highlight_url = {}, open_only_when_cursor_on_url = false})
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/sontungexpt/url-open", {event = "VeryLazy", cmd = "URLOpenUnderCursor", config = config})
