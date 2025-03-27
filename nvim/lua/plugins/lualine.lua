-- [nfnl] Compiled from fnl/plugins/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function config()
  local lualine = require("lualine")
  return lualine.setup({options = {component_separators = {left = "\238\130\176", right = "\238\130\178"}, section_separators = {left = "\238\130\176", right = "\238\130\178"}, theme = "auto"}, sections = {lualine_a = {"mode"}, lualine_b = {{"filename", file_status = true, path = 1, symbols = {modified = " \239\129\177 ", readonly = "[-]", unnamed = "[No Name]"}}, {"diagnostics", sources = {"coc"}}, {"g:coc_status", "bo:filetype"}}, lualine_c = {}, lualine_x = {"encoding"}, lualine_y = {{"filetype", colored = true}}, lualine_z = {{"%3p%%/%4L %4l:%3v"}}}, extensions = {"quickfix", "nvim-tree"}})
end
--[[ (config) ]]
return {utils.dep("https://github.com/nvim-lualine/lualine.nvim", {config = config})}
