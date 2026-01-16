-- [nfnl] nvim/fnl/plugins/url-open.fnl
local utils = require("utils")
local function config()
  local _1_, url_open = pcall(require, "url-open")
  if _1_ then
    return url_open.setup({highlight_url = {all_urls = {enabled = false}, cursor_move = {enabled = false}}, open_only_when_cursor_on_url = false})
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/sontungexpt/url-open", {cmd = {"OpenUrlUnderCursor", "URLOpenUnderCursor"}, config = config})
