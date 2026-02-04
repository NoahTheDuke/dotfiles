-- [nfnl] fnl/noahtheduke/plugins/zprint.fnl
local utils = require("noahtheduke.utils")
local function _1_()
  vim.g["zprint#make_autocmd"] = 0
  return vim.api.nvim_create_user_command("ZPrint", "call zprint#apply()", {})
end
return utils.dep("https://github.com/bfontaine/zprint.vim", {ft = "clojure", config = _1_})
