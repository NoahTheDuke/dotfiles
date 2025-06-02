-- [nfnl] nvim/fnl/plugins/vim-json.fnl
local utils = require("utils")
local function _1_()
  vim.g.vim_json_syntax_conceal = 0
  return nil
end
return utils.dep("https://github.com/elzr/vim-json", {ft = "json", config = _1_})
