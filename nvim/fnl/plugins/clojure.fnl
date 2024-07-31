(local utils (require :utils))

(fn config []
  (set vim.g.clojure_fuzzy_indent_patterns
       ["^with" "^def" "^let" "^expect" "from-each" "given" "describe" "it" "changed"
        "do-game"])
  (vim.cmd
    "
    augroup clojure
    autocmd!
    autocmd FileType clojure setlocal lispwords+=before-each
    augroup END
    "))

(comment
  (config))

[(utils.dep
   "https://github.com/clojure-vim/clojure.vim"
   {:branch "indent-forms"
    :config config})]
