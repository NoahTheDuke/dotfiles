local nvim = require "vendor.nvim"

vim.g["zprint#make_autocmd"] = 0

nvim.create_user_command(
  "ZPrint",
  [[ call zprint#apply() ]],
  { }
)
