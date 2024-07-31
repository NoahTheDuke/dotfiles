(local utils (require "utils"))

(fn config []
  (local (status_ok ts_config) (pcall require "nvim-treesitter.configs"))
  (if (not status_ok) nil
    (do
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
      (vim.treesitter.language.register "clojure" "basilisp"))))

(comment
  (config))

(utils.dep
  "https://github.com/nvim-treesitter/nvim-treesitter"
  {:config config})
