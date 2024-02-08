-- [nfnl] Compiled from fnl/plugins/nvim-tree.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local nvim_tree = require("nvim-tree")
  return nvim_tree.setup({renderer = {add_trailing = true, special_files = {"Cargo.toml", "justfile", "Makefile", "project.clj", "package.json", "README.md", "Readme.md", "readme.md"}}})
end
return {utils.dep("https://github.com/kyazdani42/nvim-tree.lua", {name = "nvim-tree.lua", config = _1_})}
