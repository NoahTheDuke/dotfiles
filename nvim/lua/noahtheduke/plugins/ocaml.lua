-- [nfnl] fnl/noahtheduke/plugins/ocaml.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, ocaml
  local function _3_()
    return require("ocaml")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/ocaml.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
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
