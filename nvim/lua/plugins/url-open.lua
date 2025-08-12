-- [nfnl] nvim/fnl/plugins/url-open.fnl
local utils = require("utils")
local status_ok, url_open = pcall(require, "url-open")
if status_ok then
  url_open.setup({highlight_url = {all_urls = {enabled = false}, cursor_move = {enabled = false}}, open_only_when_cursor_on_url = false})
else
end
local function config()
  local status_ok_2_auto, url_open0 = pcall(require, "url-open")
  if status_ok_2_auto then
    return url_open0.setup({highlight_url = {all_urls = {enabled = false}, cursor_move = {enabled = false}}, open_only_when_cursor_on_url = false})
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/sontungexpt/url-open", {cmd = {"OpenUrlUnderCursor", "URLOpenUnderCursor"}, config = config})
