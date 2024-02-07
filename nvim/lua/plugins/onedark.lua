return {
  "https://github.com/navarasu/onedark.nvim",
  name = "onedark.nvim",
  config = function()
    require("onedark").setup({
      style = "cool",
      toggle_style_key = "<leader>cst",
    })
  end,
}
