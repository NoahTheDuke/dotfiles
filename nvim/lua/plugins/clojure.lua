vim.g.clojure_syntax_keywords = {
  clojureMacro = {
    "wait-for",
    "continue-ability",
    "do-game",
    "deftest-pending",
    "changes-val-macro",
    "when-let*",
    "before-each",
  }
}
vim.cmd [[
  augroup clojure
    autocmd FileType clojure setlocal lispwords+=before-each,do-game
  augroup END
]]
