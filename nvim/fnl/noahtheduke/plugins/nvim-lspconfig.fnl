(local utils (require "noahtheduke.utils"))

;; if you decide to customize one of these, remove from this list and add to nvim/lsp/*
(local lsp-configs
  ["fennel_ls"
   "lua_ls"
   "ocamllsp"
   "racket_langserver"
   "rust_analyzer"
   "terraformls"
   "ts_ls"])

(fn config []
  (each [_ language (ipairs lsp-configs)]
    (vim.lsp.enable language)))

(comment
  (config))

[(utils.dep
   "https://github.com/neovim/nvim-lspconfig"
   {:config config})]
