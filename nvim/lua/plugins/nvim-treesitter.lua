local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

ts_config.setup {
  ensure_installed = {
    "clojure",
    "javascript",
    "lua",
    "query",
    "rust",
    "typescript",
    "vue",
  },
  highlight = {
    enable = true,
    disable = { "clojure" },
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  playground = { enable = true },
}
