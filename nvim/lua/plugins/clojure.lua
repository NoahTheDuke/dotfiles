-- [nfnl] Compiled from fnl/plugins/clojure.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  vim.g.clojure_syntax_keywords = {clojureMacro = {"wait-for", "continue-ability", "do-game", "deftest-pending", "changes-val-macro", "when-let*", "before-each"}}
  vim.g.clojure_fuzzy_indent_patterns = {"^with", "^def", "^let", "^expect", "from-each"}
  return vim.cmd("\n        augroup clojure\n          autocmd!\n          autocmd FileType clojure setlocal lispwords+=before-each,do-game\n        augroup END\n        ")
end
return {utils.dep("https://github.com/clojure-vim/clojure.vim", {config = _1_})}
