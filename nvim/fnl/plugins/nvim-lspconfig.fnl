(local utils (require :utils))

(fn clojure-lsp []
  (vim.lsp.config :clojure-lsp {:cmd ["clojure-lsp"]
                                :filetypes ["clojure"]
                                :root_markers ["project.clj" "deps.edn" "build.boot" "shadow-cljs.edn" "bb.edn" ".git"]})
  (vim.lsp.enable :clojure-lsp)
  ; (local clojure-lsp-commands (.. (vim.fn.stdpath "config") "/data/clojure-lsp-commands.json"))
  ; (when (vim.uv.fs_stat clojure-lsp-commands)
  ;   (local commands-json (vim.json.decode (vim.fn.readblob clojure-lsp-commands)))
  ;   )
  )

(comment
  (clojure-lsp))

(local lsp-configs
  ["fennel_ls"
   "lua_ls"
   "ocamllsp"
   "racket_langserver"
   "rust_analyzer"
   "terraformls"
   "ts_ls"])

(fn config []
  (each [_ name (ipairs [:Format :FOrmat])]
    (vim.api.nvim_create_user_command
      name
      (fn [] (vim.lsp.buf.format))
      {:nargs 0}))
  (vim.api.nvim_create_user_command
    :OR
    (fn []
      (vim.lsp.buf.code_action {:context {:only ["source.organizeImports"]}
                                :apply true}))
    {:nargs 0})
  (clojure-lsp)
  (each [_ language (ipairs lsp-configs)]
    (vim.lsp.enable language)))

[
 (utils.dep
   "https://github.com/neovim/nvim-lspconfig"
   {:config config})
 ]
