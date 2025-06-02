-- [nfnl] nvim/fnl/plugins/undotree.fnl
local utils = require("utils")
return {utils.dep("https://github.com/mbbill/undotree", {name = "undotree", branch = "search"})}
