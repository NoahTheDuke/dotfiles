-- [nfnl] nvim/fnl/plugins/nvim-surround.fnl
local utils = require("utils")
local function _1_()
  local _2_, nvim_surround = pcall(require, "nvim-surround")
  if _2_ then
    return nvim_surround.setup({})
  else
    return nil
  end
end
return utils.dep("https://github.com/kylechui/nvim-surround", {config = _1_})
