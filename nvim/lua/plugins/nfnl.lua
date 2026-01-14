-- [nfnl] nvim/fnl/plugins/nfnl.fnl
local utils = require("utils")
local function _1_()
  local nfnl = require("nfnl")
  return nfnl.setup({})
end
return utils.dep("https://github.com/Olical/nfnl", {ft = "fennel", commit = "fecf731e02bc51d88372c4f992fe1ef0c19c02ae", config = _1_})
