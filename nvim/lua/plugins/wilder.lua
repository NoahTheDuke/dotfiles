-- [nfnl] nvim/fnl/plugins/wilder.fnl
local utils = require("utils")
local function _1_()
  local wilder = require("wilder")
  return wilder.setup({modes = {":", "/", "?"}})
end
return {utils.dep("https://github.com/gelguy/wilder.nvim", {config = _1_})}
