-- [nfnl] nvim/fnl/plugins/sidebar-nvim.fnl
local utils = require("utils")
local function config()
  local sidebar = require("sidebar-nvim")
  return sidebar.setup({sections = {"datetime", "buffers", "files", "git"}, files = {icon = "\239\129\187", ignored_paths = {"%.git$"}, show_hidden = false}})
end
--[[ (config) ]]
return {utils.dep("https://github.com/sidebar-nvim/sidebar.nvim", {config = config})}
