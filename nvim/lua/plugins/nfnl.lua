-- [nfnl] nvim/fnl/plugins/nfnl.fnl
local utils = require("utils")
local function config()
  local _1_, nfnl = pcall(require, "nfnl")
  if _1_ then
    return nfnl.setup({})
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/Olical/nfnl", {ft = "fennel", commit = "fecf731e02bc51d88372c4f992fe1ef0c19c02ae", config = config})
