-- [nfnl] nvim/fnl/plugins/nfnl.fnl
local utils = require("utils")
local function _1_()
  local nfnl = require("nfnl")
  return nfnl.setup({})
end
return utils.dep("https://github.com/Olical/nfnl", {config = _1_})
