return {
  "https://github.com/marko-cerovac/material.nvim",
  config = function()
    vim.g.material_style = "deep ocean"
    require('material').setup()
  end,
}
