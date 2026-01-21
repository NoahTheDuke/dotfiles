-- [nfnl] nvim/fnl/plugins/jj-nvim.fnl
local utils = require("utils")
local function config()
  local _1_, jj = pcall(require, "jj")
  if _1_ then
    return jj.setup({})
  else
    return nil
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/NicolasGB/jj.nvim", {config = config})}
