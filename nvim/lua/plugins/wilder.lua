-- [nfnl] Compiled from fnl/plugins/wilder.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local wilder = require("wilder")
  return wilder.setup({modes = {":", "/", "?"}})
end
return {utils.dep("https://github.com/gelguy/wilder.nvim", {name = "wilder.nvim", config = _1_})}
