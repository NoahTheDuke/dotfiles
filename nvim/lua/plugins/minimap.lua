-- :MinimapToggle
return {
  "https://github.com/wfxr/minimap.vim",
  config = function()
    vim.g.minimap_highlight_range = 1
    vim.g.minimap_width = 10
    vim.g.minimap_git_colors = 1
  end,
}
