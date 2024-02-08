(local utils (require :utils))

[(utils.dep
   "https://github.com/clojure-vim/clojure.vim"
   {:name "clojure.vim"
    :config
    (fn []
      (set vim.g.clojure_syntax_keywords
           {:clojureMacro ["wait-for"
                           "continue-ability"
                           "do-game"
                           "deftest-pending"
                           "changes-val-macro"
                           "when-let*"
                           "before-each"]})
      (set vim.g.clojure_fuzzy_indent_patterns
           ["^with" "^def" "^let" "^expect" "from-each"])
      (vim.cmd
        "
        augroup clojure
          autocmd!
          autocmd FileType clojure setlocal lispwords+=before-each,do-game
        augroup END
        "))})]
