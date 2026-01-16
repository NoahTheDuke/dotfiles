-- [nfnl] nvim/fnl/plugins/text-case-nvim.fnl
local utils = require("utils")
local function config()
  local _1_, tc = pcall(require, "textcase")
  if _1_ then
    tc.setup({})
    local _2_, telescope = pcall(require, "telescope")
    if _2_ then
      return telescope.load_extension("textcase")
    else
      return nil
    end
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/johmsalas/text-case.nvim", {dependencies = {"https://github.com/nvim-telescope/telescope.nvim"}, config = config})
