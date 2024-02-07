return {
  "https://github.com/Everblush/everblush.nvim",
  name = "everblush",
  config = function()
    require('everblush').setup({
      nvim_tree = { contrast = true },
    })
  end,
}
