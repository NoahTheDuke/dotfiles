-- [nfnl] Compiled from fnl/plugins/nfnl.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local nfnl = require("nfnl")
  return nfnl.setup({})
end
return utils.dep("https://github.com/Olical/nfnl", {name = "nfnl", config = _1_})
