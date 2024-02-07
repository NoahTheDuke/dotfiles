-- gcc
return {
  "https://github.com/terrortylor/nvim-comment",
  name = "nvim-comment",
  config = function()
    require("nvim_comment").setup({
      comment_empty = false,
    })
  end,
}
