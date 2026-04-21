(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ config []
  (set vim.g.clojure_fuzzy_indent_patterns
       ["^with" "^def" "^let" "^\\([^\\s]*/\\)\\?expect" "from-each" "given" "describe" "it" "changed"
        "do-game"])
  (set vim.g.clojure_indent_style :standard)
  ; (set vim.g.clojure_indent_rules.before-each 1)
  )

(comment
  (config))

[
 (utils.dep
   "https://github.com/clojure-vim/clojure.vim"
   {:branch "indent-forms"
    :config config})
 ; (utils.dep
 ;   {:dir "/Users/noah/programming/clojure.nvim"
 ;    :config (fn []
 ;              (when-require [clj-nvim "clojure-nvim"]
 ;                (clj-nvim.setup {:lsp {:register-keymaps true
 ;                                       :config {:trace :verbose
 ;                                                :init_options {:log-path "/tmp/clojure-lsp.out"}}}}))
 ;              )})
 ]
