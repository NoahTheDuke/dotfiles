return {
  "https://github.com/nvim-treesitter/nvim-treesitter",
  name = "nvim-treesitter",
  config = function()
    local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    ts_config.setup({
      ensure_installed = {
        "clojure",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "ocaml",
        "query",
        "rust",
        "typescript",
        "vimdoc",
        "vue",
      },
      highlight = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
      playground = { enable = true },
    })
  end,
}
