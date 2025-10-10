-- [nfnl] nvim/fnl/plugins/ocaml.fnl
local utils = require("utils")
local function config()
  local status_ok_2_auto, ocaml = pcall(require, "ocaml")
  if status_ok_2_auto then
    return ocaml.setup({})
  else
    return nil
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/tarides/ocaml.nvim", {ft = "ocaml", config = config})}
