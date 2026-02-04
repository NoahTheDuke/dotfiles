(local utils (require "noahtheduke.utils"))

(λ config []
  (set vim.g.clojure_fuzzy_indent_patterns
       ["^with" "^def" "^let" "^\\([^\\s]*/\\)\\?expect" "from-each" "given" "describe" "it" "changed"
        "do-game"])
  (set vim.g.clojure_indent_style :standard)
  ; (set vim.g.clojure_indent_rules.before-each 1)
  )

(comment
  (config))

[(utils.dep
   "https://github.com/clojure-vim/clojure.vim"
   {:branch "indent-forms"
    :config config})]
