-- [nfnl] fnl/noahtheduke/plugins/vim-projectionist.fnl
local utils = require("noahtheduke.utils")
local function config()
  vim.g.projectionist_heuristics = {["deps.edn"] = {["src/*.clj"] = {type = "source", alternate = "test/{}_test.clj"}, ["test/*_test.clj"] = {type = "test", alternate = "src/{}.clj"}}}
  return nil
end
--[[ (config) ]]
return {utils.dep("https://github.com/tpope/vim-projectionist", {name = "vim-projectionist", config = config})}
