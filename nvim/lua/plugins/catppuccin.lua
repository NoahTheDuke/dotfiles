return {
  "https://github.com/catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      -- latte, frappe, macchiato, mocha
      flavour = "frappe"
    })
  end,
}
