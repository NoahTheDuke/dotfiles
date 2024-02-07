-- Prettify wild menu
return {
  "https://github.com/gelguy/wilder.nvim",
  run = ":UpdateRemotePlugins",
  dependencies = {
    "https://github.com/roxma/nvim-yarp",
    "https://github.com/roxma/vim-hug-neovim-rpc",
  },
  config = function()
    require("wilder").setup({
      modes = { ':', '/', '?' },
    })
  end,
}
