-- [nfnl] fnl/noahtheduke/plugins/vim-projectionist.fnl
local utils = require("noahtheduke.utils")
local heuristics = {["src/*.clj"] = {type = "source", alternate = "test/{}_test.clj"}, ["src/*.cljs"] = {type = "source", alternate = "test/{}_test.cljs"}, ["src/*.cljc"] = {type = "source", alternate = "test/{}_test.cljc"}, ["test/*_test.clj"] = {type = "test", alternate = "src/{}.clj"}, ["test/*_test.cljs"] = {type = "test", alternate = "src/{}.cljs"}, ["test/*_test.cljc"] = {type = "test", alternate = "src/{}.cljc"}}
local function config()
  vim.g.projectionist_heuristics = {["deps.edn"] = heuristics, ["project.clj"] = heuristics}
  return nil
end
--[[ (config) ]]
return {utils.dep("https://github.com/tpope/vim-projectionist", {name = "vim-projectionist", config = config})}
