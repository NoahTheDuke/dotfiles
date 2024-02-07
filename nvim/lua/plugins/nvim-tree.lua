-- :NvimTreeToggle
return {
  "https://github.com/kyazdani42/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      renderer = {
        add_trailing = true,
        special_files = {
          "Cargo.toml",
          "justfile",
          "Makefile",
          "project.clj",
          "package.json",
          "README.md",
          "Readme.md",
          "readme.md",
        }
      }
    })
  end,
}
