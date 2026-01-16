-- [nfnl] nvim/fnl/plugins/ocaml.fnl
local utils = require("utils")
local function config()
  local _1_, ocaml = pcall(require, "ocaml")
  if _1_ then
    return ocaml.setup({})
  else
    return nil
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/tarides/ocaml.nvim", {ft = "ocaml", config = config})}
