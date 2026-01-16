-- [nfnl] nvim/fnl/plugins/which-key.fnl
local utils = require("utils")
local function _1_()
  local _2_, which = pcall(require, "which-key")
  if _2_ then
    return which.setup()
  else
    return nil
  end
end
return utils.dep("https://github.com/folke/which-key.nvim", {config = _1_})
