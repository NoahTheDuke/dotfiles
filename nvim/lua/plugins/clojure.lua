-- [nfnl] nvim/fnl/plugins/clojure.fnl
local utils = require("utils")
local function config()
  vim.g.clojure_fuzzy_indent_patterns = {"^with", "^def", "^let", "^\\(.*/\\)\\?expect", "from-each", "given", "describe", "it", "changed", "do-game"}
  vim.g.clojure_indent_style = "standard"
  return nil
end
--[[ (config) ]]
return {utils.dep("https://github.com/clojure-vim/clojure.vim", {branch = "indent-forms", config = config})}
