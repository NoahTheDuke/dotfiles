(local utils (require "utils"))

(fn config []
  (local (status_ok ts_config) (pcall require "nvim-treesitter.configs"))
  (when status_ok
    (ts_config.setup
      {:ensure_installed ["clojure"
                          "djot"
                          "fennel"
                          "javascript"
                          "lua"
                          "markdown"
                          "markdown_inline"
                          "ocaml"
                          "query"
                          "rust"
                          "typescript"
                          "vimdoc"
                          "vue"]
       :highlight {:enable true}
       :incremental_selection {:enable true}
       :textobjects {:enable true}
       :playground {:enable true}})
    ; (local parsers (require "nvim-treesitter.parsers"))
    ; (local parser-config (parsers:get_parser_configs))
    ; (set parser-config.fluent
    ;      {:install_info {:url "~/personal/tree-sitter-fluent"
    ;                      :files ["src/parser.c"]}
    ;       :filetype "fluent"})
    (vim.treesitter.language.register "clojure" "basilisp")
    ))

(comment
  (config))

(utils.dep
  "https://github.com/nvim-treesitter/nvim-treesitter"
  {:config config})
