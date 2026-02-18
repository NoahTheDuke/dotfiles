(local utils (require "noahtheduke.utils"))
(local edn (require "edn"))
(import-macros {: callback : when-require} "noahtheduke.util-macros")

(local clojure-lsp-commands
  (.. (vim.fn.stdpath "config") "/data/clojure-lsp-commands.edn"))

(λ get-uri-and-pos []
  (let [[row col] (vim.api.nvim_win_get_cursor 0)
        uri (vim.uri_from_bufnr 0)]
    [uri (- row 1) col]))

(λ get-client [name]
  (. (vim.lsp.get_clients {: name}) 1))

(fn execute-positional-command [cmd args]
  (let [client (get-client "clojure-lsp")
        [uri row col] (get-uri-and-pos)]
    (client:exec_cmd {:command (. cmd :command)
                      :arguments [uri row col (if (= "string" (type args))
                                                args
                                                (unpack (or args [])))]})
    (vim.api.nvim__redraw {:buf 0 :flush true})))

(fn execute-prompt-command [cmd args]
  (let [prompt (. cmd :prompt)]
    (if (not args)
      (vim.ui.input {:prompt (.. prompt " ")} #(execute-positional-command cmd $))
      (execute-positional-command cmd (?. args :args)))))

(fn execute-choice-command [cmd args]
  (let [{: prompt : choices} cmd]
    (if (not args)
      (vim.ui.select choices {: prompt} #(execute-positional-command cmd $))
      (execute-positional-command cmd (?. args :args)))))

(λ get-command-fn [cmd]
  (case (. cmd :type)
    "positional" (fn [_args] (execute-positional-command cmd nil))
    "prompt" (fn [args] (execute-prompt-command cmd args))
    "choice" (fn [args] (execute-choice-command cmd args))))

(λ register-keymaps [commands]
  (each [_ cmd (ipairs commands)]
    (when (. cmd :shortcut)
      (vim.keymap.set "n" (.. "<leader>cl" (. cmd :shortcut))
                      (get-command-fn cmd)
                      {:silent true
                       :noremap true
                       :desc (.. "clojure-lsp-" (. cmd :command))}))))

(λ register-commands [commands]
  (when-require [textcase "textcase"]
    (each [_ cmd (ipairs commands)]
      (let [nargs (if (. cmd :positional) "0" "?")]
        (vim.api.nvim_create_user_command
          (.. "CljLsp" (textcase.api.to_pascal_case (. cmd :command)))
          (get-command-fn cmd)
          {: nargs})))
    (vim.api.nvim_create_user_command
      :CljLspCursorInfo
      (λ []
        (let [[uri row col] (get-uri-and-pos)]
          (vim.lsp.buf_notify 0 "clojure/cursorInfo/log"
                              {:textDocument {: uri}
                               :position {:line row
                                          :character col}})))
      {:nargs 0})
    (vim.api.nvim_create_user_command
      :CljLspServerInfo
      #(vim.lsp.buf_notify 0 "clojure/serverInfo/log")
      {:nargs 0})
    (vim.api.nvim_create_user_command
      :CljLspProjectTree
      #(vim.lsp.buf_request_sync 0 "clojure/workspace/projectTree/nodes")
      {:nargs 0})
    nil))

(each [_ name (ipairs [:Format :FOrmat])]
  (vim.api.nvim_create_user_command
    name
    vim.lsp.buf.format
    {:nargs 0}))

(vim.api.nvim_create_user_command
  :OR
  #(vim.lsp.buf.code_action {:context {:only ["source.organizeImports"]}
                             :apply true})
  {:nargs 0})

(vim.diagnostic.config
  {:signs {:text {vim.diagnostic.severity.ERROR ""
                  vim.diagnostic.severity.WARN ""
                  vim.diagnostic.severity.INFO ""
                  vim.diagnostic.severity.HINT ""}}})

(vim.keymap.set "n" "K" (λ [] (vim.lsp.buf.hover {:border "rounded"}))
                (utils.ks-opts "show docs"))
(vim.keymap.set "i" "<C-o>" (λ [] (vim.lsp.buf.signature_help {:border "rounded"}))
                (utils.ks-opts "show signature help"))

(λ show-docs []
  "show vim docs, or show lsp hover, or check keywordprg"
  (let [cw (vim.fn.expand "<cword>")]
    (if
      ;; vim help
      (<= 0 (vim.fn.index ["vim" "help"] vim.bo.filetype))
      (vim.api.nvim_command (.. "h " cw))
      ;; hover
      (< 0 (length (vim.lsp.get_clients {:bufnr 0})))
      (vim.lsp.buf.definition)
      ;; default
      (vim.api.nvim_command (.. "!" vim.o.keywordprg " " cw))))
  nil)

(vim.keymap.set "n" "gd" show-docs (utils.ks-opts "go to definition"))

(vim.lsp.config :clojure-lsp {:cmd ["clojure-lsp"]
                              :filetypes ["clojure"]
                              :root_markers ["project.clj" "deps.edn" "build.boot" "shadow-cljs.edn" "bb.edn" ".git"]
                              :init_options {:log-path "/tmp/clojure-lsp.out"}
                              :trace "verbose"})

(vim.lsp.enable :clojure-lsp)

(when (vim.uv.fs_stat clojure-lsp-commands)
  (let [commands (edn.decode (vim.fn.readblob clojure-lsp-commands))]
    (register-keymaps commands)
    (register-commands commands)))

(if (= 1 (vim.fn.has "nvim-0.12.0"))
  (vim.lsp.semantic_tokens.enable false))

(vim.api.nvim_create_autocmd
  ["CursorHold"]
  {:group (vim.api.nvim_create_augroup "lspCursorHold" {:clear true})
   :pattern "*"
   :callback (callback [_args]
               (vim.diagnostic.open_float {:header ""
                                           :scope "cursor"
                                           :focus false}))})

(vim.api.nvim_create_autocmd
  ["LspAttach"]
  {:callback (callback [args]
               (vim.lsp.document_color.enable false args.buf))})

nil
