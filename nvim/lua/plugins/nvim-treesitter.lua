local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

ts_config.setup {
  ensure_installed = {
    "clojure",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "query",
    "rust",
    "typescript",
    "vue",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "clojure" },
    -- disable = { "clojure", "just" },
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  playground = { enable = true },
}
