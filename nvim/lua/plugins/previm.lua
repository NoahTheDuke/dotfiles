-- [nfnl] nvim/fnl/plugins/previm.fnl
local utils = require("utils")
local function _1_()
  vim.g.previm_open_cmd = "open"
  return nil
end
return {utils.dep("https://github.com/previm/previm", {config = _1_})}
