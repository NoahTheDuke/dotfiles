-- json
return {
  "https://github.com/elzr/vim-json",
  name = "vim-json",
  ft = "json",
  config = function()
    vim.g.vim_json_syntax_conceal = 0
  end,
}
