(local utils (require :utils))

(fn config []
  (set vim.g.clojure_syntax_keywords
       {:clojureMacro ["wait-for"
                       "continue-ability"
                       "do-game"
                       "deftest-pending"
                       "changes-val-macro"
                       "when-let*"
                       "before-each"]})
  (set vim.g.clojure_fuzzy_indent_patterns
       ["^with" "^def" "^let" "^expect" "from-each" "given" "describe" "it"])
  (vim.cmd
    "
    augroup clojure
    autocmd!
    autocmd FileType clojure setlocal lispwords+=before-each,do-game
    augroup END
    "))

(comment
  (config))

[(utils.dep
   "https://github.com/clojure-vim/clojure.vim"
   {:config config})]
