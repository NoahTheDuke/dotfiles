-- [nfnl] nvim/fnl/plugins/text-case-nvim.fnl
local utils = require("utils")
local function config()
  local status_ok_2_auto, tc = pcall(require, "textcase")
  if status_ok_2_auto then
    tc.setup({})
    local status_ok_2_auto0, telescope = pcall(require, "telescope")
    if status_ok_2_auto0 then
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
