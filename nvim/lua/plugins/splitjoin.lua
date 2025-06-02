-- [nfnl] nvim/fnl/plugins/splitjoin.fnl
local utils = require("utils")
local function _1_()
  vim.g.splitjoin_trailing_comma = 1
  return nil
end
return utils.dep("https://github.com/AndrewRadev/splitjoin.vim", {config = _1_})
