-- [nfnl] Compiled from fnl/plugins/nvim-comment.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local nvim_comment = require("nvim_comment")
  return nvim_comment.setup({comment_empty = false})
end
return utils.dep("https://github.com/terrortylor/nvim-comment", {name = "nvim-comment", config = _1_})
