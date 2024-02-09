-- [nfnl] Compiled from fnl/plugins/vlime.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_(plugin)
  return (vim.opt.rtp):append((plugin.dir .. "/vim"))
end
return {utils.dep("https://github.com/vlime/vlime", {ft = "lisp", config = _1_})}
