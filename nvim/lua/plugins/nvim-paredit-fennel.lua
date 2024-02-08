-- [nfnl] Compiled from fnl/plugins/nvim-paredit-fennel.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local dep = require("nvim-paredit-fennel")
  return dep.setup()
end
return utils.dep("julienvincent/nvim-paredit-fennel", {dependencies = {"julienvincent/nvim-paredit"}, ft = {"fennel"}, config = _1_})
