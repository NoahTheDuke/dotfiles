-- [nfnl] Compiled from fnl/plugins/previm.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  vim.g.previm_open_cmd = "firefox"
  return nil
end
return {utils.dep("https://github.com/previm/previm", {config = _1_})}
