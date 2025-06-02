-- [nfnl] nvim/fnl/plugins/nvim-surround.fnl
local utils = require("utils")
local function _1_()
  local nvim_surround = require("nvim-surround")
  return nvim_surround.setup({})
end
return utils.dep("https://github.com/kylechui/nvim-surround", {config = _1_})
