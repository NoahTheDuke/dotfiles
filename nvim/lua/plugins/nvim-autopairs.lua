-- [nfnl] Compiled from fnl/plugins/nvim-autopairs.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local autopairs = require("nvim-autopairs")
  autopairs.setup({check_ts = true, ts_config = {lua = {"string"}, javascript = {"string", "template_string"}}, break_undo = false, enable_check_bracket_line = false, map_cr = false})
  do end ((autopairs.get_rules("'"))[1])["not_filetypes"] = {"scheme", "lisp", "clojure"}
  (autopairs.get_rules("`"))[1]["not_filetypes"] = {"scheme", "lisp", "clojure"}
  return nil
end
return utils.dep("https://github.com/windwp/nvim-autopairs", {config = _1_})
