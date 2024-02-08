-- [nfnl] Compiled from fnl/plugins/splitjoin.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  vim.g.splitjoin_trailing_comma = 1
  return nil
end
return utils.dep("https://github.com/AndrewRadev/splitjoin.vim", {name = "splitjoin.vim", config = _1_})
