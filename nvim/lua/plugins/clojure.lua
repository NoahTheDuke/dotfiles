-- [nfnl] Compiled from fnl/plugins/clojure.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function config()
  vim.g.clojure_fuzzy_indent_patterns = {"^with", "^def", "^let", "^expect", "from-each", "given", "describe", "it", "changed", "do-game"}
  return vim.cmd("\n    augroup clojure\n    autocmd!\n    autocmd FileType clojure setlocal lispwords+=before-each\n    augroup END\n    ")
end
--[[ (config) ]]
return {utils.dep("https://github.com/clojure-vim/clojure.vim", {branch = "indent-forms", config = config})}
