-- [nfnl] nvim/fnl/plugins/wilder.fnl
local utils = require("utils")
local function _1_()
  local _2_, wilder = pcall(require, "wilder")
  if _2_ then
    return wilder.setup({modes = {":", "/", "?"}})
  else
    return nil
  end
end
return {utils.dep("https://github.com/gelguy/wilder.nvim", {config = _1_})}
