-- [nfnl] Compiled from fnl/plugins/minimap.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  vim.g.minimap_highlight_range = 1
  vim.g.minimap_width = 10
  vim.g.minimap_git_colors = 1
  return nil
end
return {utils.dep("https://github.com/wfxr/minimap.vim", {name = "minimap.vim", config = _1_})}
