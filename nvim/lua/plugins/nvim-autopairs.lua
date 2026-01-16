-- [nfnl] nvim/fnl/plugins/nvim-autopairs.fnl
local utils = require("utils")
local function config()
  local _1_, autopairs = pcall(require, "nvim-autopairs")
  if _1_ then
    autopairs.setup({check_ts = true, ts_config = {lua = {"string"}, javascript = {"string", "template_string"}}, break_undo = false, enable_check_bracket_line = false, map_cr = false})
    autopairs.get_rules("'")[1]["not_filetypes"] = {"scheme", "lisp", "clojure", "ocaml"}
    autopairs.get_rules("`")[1]["not_filetypes"] = {"scheme", "lisp", "clojure", "ocaml"}
    return nil
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/windwp/nvim-autopairs", {config = config})
