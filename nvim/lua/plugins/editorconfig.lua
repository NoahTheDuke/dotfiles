-- [nfnl] nvim/fnl/plugins/editorconfig.fnl
local utils = require("utils")
local function _1_()
  vim.g.EditorConfig_exclude_patterns = {"fugitive://.*"}
  return nil
end
return {utils.dep("https://github.com/gpanders/editorconfig.nvim", {config = _1_})}
