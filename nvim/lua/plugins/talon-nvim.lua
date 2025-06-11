-- [nfnl] nvim/fnl/plugins/talon-nvim.fnl
local utils = require("utils")
local function config()
  local status_ok, talon = pcall(require, "talon")
  if status_ok then
    return talon.setup()
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/hands-free-vim/talon.nvim", {config = config})
