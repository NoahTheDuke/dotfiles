-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local which = require("which-key")
  return which.setup()
end
return utils.dep("https://github.com/folke/which-key.nvim", {config = _1_})
