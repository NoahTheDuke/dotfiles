require("nvim-autopairs").setup({
  map_cr = false,
  check_ts = true,
  ts_config = {
    clojure = { 'string' },
    lua = { 'string' },
    javascript = { 'string', 'template_string' },
  }
})
