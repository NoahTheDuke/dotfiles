local nvim = require "vendor.nvim"

-- clojure
return {
  "https://github.com/bfontaine/zprint.vim",
  name = "zprint.vim",
  ft = "clojure",
  config = function()
    vim.g["zprint#make_autocmd"] = 0

    nvim.create_user_command(
      "ZPrint",
      [[ call zprint#apply() ]],
      { }
    )
  end,
}
