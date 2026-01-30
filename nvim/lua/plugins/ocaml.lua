-- [nfnl] nvim/fnl/plugins/ocaml.fnl
local utils = require("utils")
local function config()
  local errors_1_ = {}
  local _2_, ocaml
  local function _3_()
    return require("ocaml")
  end
  local function _4_(err_1_auto)
    return table.insert(errors_1_, debug.traceback(err_1_auto))
  end
  _2_, ocaml = xpcall(_3_, _4_)
  if _2_ then
    return ocaml.setup({})
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/tarides/ocaml.nvim", {ft = "ocaml", config = config})}
