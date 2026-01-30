(local edn (require :edn))
(import-macros {: when-require} :nvim/fnl/util-macros)

(local keyset vim.keymap.set)

(local clojure-lsp-commands (.. (vim.fn.stdpath "config") "/data/clojure-lsp-commands.edn"))

(fn get-uri-and-pos []
  (let [[row col] (vim.api.nvim_win_get_cursor 0)
        uri (vim.uri_from_bufnr 0)]
    [uri (- row 1) col]))

(fn get-client [name]
  (. (vim.lsp.get_clients {: name}) 1))

(fn register-keymaps [commands]
  (each [_ v (ipairs commands)]
    (when (. v :shortcut)
      (keyset "n" (.. "<leader>cl" (. v :shortcut))
              (fn []
                (let [client (get-client "clojure-lsp")]
                  (when client
                    (client:exec_cmd {:command (. v :command)
                                      :arguments (get-uri-and-pos)})
                    (vim.api.nvim__redraw {:buf 0 :flush true}))))
              {:silent true
               :noremap true
               :desc (.. "clojure-lsp-" (. v :command))}))))

(fn execute-positional-command [cmd ...]
  (let [client (get-client "clojure-lsp")
        [uri row col] (get-uri-and-pos)]
    (client:exec_cmd {:command (. cmd :command)
                      :arguments [uri row col ...]})))

(fn execute-prompt-command [cmd args]
  (local prompt (. cmd :prompt))
  (if (= "" (. args :args))
    (vim.ui.input {: prompt} #(execute-positional-command cmd $))
    (execute-positional-command cmd (. args :args))))

(fn execute-choice-command [cmd args]
  (local {: prompt : choices} cmd)
  (if (= "" (. args :args))
    (vim.ui.select choices {: prompt} (fn [choice]
                                        (if (~= choice nil)
                                          (execute-positional-command cmd choice)
                                          (execute-positional-command cmd))))
    (execute-positional-command cmd (. args :args))))

(fn register-commands [commands]
  (when-require [textcase "textcase"]
    (each [_ cmd (ipairs commands)]
      (local nargs (if (. cmd :positional) "0" "?"))
      (local cmd-type (. cmd :type))
      (vim.api.nvim_create_user_command
        (textcase.api.to_pascal_case (.. "CljLsp" (. cmd :command)))
        (case cmd-type
          "positional" (fn [] (execute-positional-command cmd))
          "prompt" (fn [args] (execute-prompt-command cmd args))
          "choice" (fn [args] (execute-choice-command cmd args)))
        {: nargs}))
    (vim.api.nvim_create_user_command
      :CljLspCursorInfo
      (fn []
        (let [[uri row col] (get-uri-and-pos)]
          (vim.lsp.buf_notify 0 "clojure/cursorInfo/log"
                              {:textDocument {: uri}
                               :position {:line row
                                          :character col}})))
      {:nargs 0})
    (vim.api.nvim_create_user_command
      :CljLspServerInfo
      (fn [] (vim.lsp.buf_notify 0 "clojure/serverInfo/log"))
      {:nargs 0})
    (vim.api.nvim_create_user_command
      :CljLspProjectTree
      (fn [] (vim.lsp.buf_request_sync 0 "clojure/workspace/projectTree/nodes"))
      {:nargs 0})
    nil))

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

(vim.lsp.config :clojure-lsp {:cmd ["clojure-lsp"]
                              :filetypes ["clojure"]
                              :root_markers ["project.clj" "deps.edn" "build.boot" "shadow-cljs.edn" "bb.edn" ".git"]
                              :init_options {:log-path "/tmp/clojure-lsp.out"}
                              :trace "verbose"})

(vim.lsp.enable :clojure-lsp)

(when (vim.uv.fs_stat clojure-lsp-commands)
  (local commands (edn.decode (vim.fn.readblob clojure-lsp-commands)))
  (register-keymaps commands)
  (register-commands commands))

nil
