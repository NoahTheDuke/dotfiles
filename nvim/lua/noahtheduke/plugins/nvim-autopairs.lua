-- [nfnl] fnl/noahtheduke/plugins/nvim-autopairs.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, autopairs
  local function _3_()
    return require("nvim-autopairs")
  end
  local function _4_(err_1_auto)
    return table.insert(errors_1_, debug.traceback(err_1_auto))
  end
  _2_, autopairs = xpcall(_3_, _4_)
  if _2_ then
    autopairs.setup({check_ts = true, ts_config = {lua = {"string"}, javascript = {"string", "template_string"}}, break_undo = false, enable_check_bracket_line = false, map_cr = false})
    autopairs.get_rules("'")[1]["not_filetypes"] = {"scheme", "lisp", "clojure", "ocaml"}
    autopairs.get_rules("`")[1]["not_filetypes"] = {"scheme", "lisp", "clojure", "ocaml"}
    return nil
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/windwp/nvim-autopairs", {config = config})
