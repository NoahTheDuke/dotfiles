-- automatically create closing "" and () etc
return {
  "https://github.com/windwp/nvim-autopairs.git",
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup({
      map_cr = false,
      check_ts = true,
      enable_check_bracket_line = false,
      break_undo = false,
      ts_config = {
        lua = { 'string' },
        javascript = { 'string', 'template_string' },
      }
    })
    autopairs.get_rules("'")[1].not_filetypes = { "scheme", "lisp", "clojure" }
    autopairs.get_rules("`")[1].not_filetypes = { "scheme", "lisp", "clojure" }
  end,
}
