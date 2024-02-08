-- [nfnl] Compiled from fnl/plugins/nvim-surround.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local nvim_surround = require("nvim-surround")
  return nvim_surround.setup({})
end
return utils.dep("https://github.com/kylechui/nvim-surround", {name = "nvim-surround", config = _1_})
