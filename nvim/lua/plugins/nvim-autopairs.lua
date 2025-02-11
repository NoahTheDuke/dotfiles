-- [nfnl] Compiled from fnl/plugins/nvim-autopairs.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function config()
  local status_ok, autopairs = pcall(require, "nvim-autopairs")
  if not status_ok then
    return nil
  else
    autopairs.setup({check_ts = true, ts_config = {lua = {"string"}, javascript = {"string", "template_string"}}, break_undo = false, enable_check_bracket_line = false, map_cr = false})
    autopairs.get_rules("'")[1]["not_filetypes"] = {"scheme", "lisp", "clojure", "ocaml"}
    autopairs.get_rules("`")[1]["not_filetypes"] = {"scheme", "lisp", "clojure", "ocaml"}
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/windwp/nvim-autopairs", {config = config()})
