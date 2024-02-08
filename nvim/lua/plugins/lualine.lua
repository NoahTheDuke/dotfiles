-- [nfnl] Compiled from fnl/plugins/lualine.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local lualine = require("lualine")
  return lualine.setup({options = {component_separators = {left = "\238\130\176", right = "\238\130\178"}, section_separators = {left = "\238\130\176", right = "\238\130\178"}, theme = "auto"}, sections = {lualine_a = {"mode"}, lualine_b = {{"filename", file_status = true, path = 1, symbols = {modified = " \239\129\177 ", readonly = "[-]", unnamed = "[No Name]"}}, {"diagnostics", sources = {"coc"}}, "%{coc#status()}"}, lualine_c = {}, lualine_x = {{"encoding", "fileformat"}}, lualine_y = {{"filetype", colored = true}}, lualine_z = {{"%3p%%/%4L %4l:%3v"}}}, tabline = {lualine_a = {"buffers"}, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {"tabs"}}, extensions = {"quickfix", "nvim-tree"}})
end
return {utils.dep("https://github.com/nvim-lualine/lualine.nvim", {name = "lualine.nvim", config = _1_})}
