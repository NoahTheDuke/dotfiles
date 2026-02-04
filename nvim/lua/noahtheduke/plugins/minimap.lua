-- [nfnl] fnl/noahtheduke/plugins/minimap.fnl
local utils = require("noahtheduke.utils")
local function _1_()
  vim.g.minimap_highlight_range = 1
  vim.g.minimap_width = 10
  vim.g.minimap_git_colors = 1
  return nil
end
return {utils.dep("https://github.com/wfxr/minimap.vim", {config = _1_})}
