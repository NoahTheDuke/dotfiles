return {
  "https://github.com/gpanders/editorconfig.nvim",
  name = "editorconfig.nvim",
  config = function ()
    vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }
  end,
}
