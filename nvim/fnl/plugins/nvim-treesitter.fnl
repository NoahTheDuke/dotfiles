(local utils (require "utils"))
(import-macros {: when-require} "nvim/fnl/util-macros")

(fn config []
  (when-require [ts-config "nvim-treesitter.configs"]
    (ts-config.setup
      {:ensure_installed ["angular"
                          "clojure"
                          "djot"
                          "fennel"
                          "javascript"
                          "lua"
                          "markdown"
                          "markdown_inline"
                          "ocaml"
                          "query"
                          "rust"
                          "scheme"
                          "typescript"
                          "vimdoc"
                          "vue"]
       :highlight {:enable true}
       :incremental_selection {:enable true}
       :textobjects {:enable true}
       :playground {:enable true}})
    (when-require [parsers "nvim-treesitter.parsers"]
      (local parser-config (parsers:get_parser_configs))
      (set parser-config.asciidoc
           {:install_info {:url "https://github.com/cathaysia/tree-sitter-asciidoc.git"
                           :files ["tree-sitter-asciidoc/src/parser.c"
                                   "tree-sitter-asciidoc/src/scanner.c"]
                           :branch "master"
                           :generate_requires_npm false
                           :requires_generate_from_grammar false}})
      (set parser-config.asciidoc_inline
           {:install_info {:url "https://github.com/cathaysia/tree-sitter-asciidoc.git"
                           :files ["tree-sitter-asciidoc_inline/src/parser.c"
                                   "tree-sitter-asciidoc_inline/src/scanner.c"]
                           :branch "master"
                           :generate_requires_npm false
                           :requires_generate_from_grammar false}})
      (set parser-config.talon
           {:install_info {:url "https://github.com/wenkokke/tree-sitter-talon.git"
                           :files ["src/parser.c"
                                   "src/scanner.c"]
                           :branch "dev"
                           :generate_requires_npm false
                           :requires_generate_from_grammar false}})
      (vim.treesitter.language.register "clojure" "basilisp")
      (vim.treesitter.language.register "scheme" "dune")
      )))

(comment
  (config))

(utils.dep
  "https://github.com/nvim-treesitter/nvim-treesitter"
  {:config config
   :build ":TSUpdate"})
