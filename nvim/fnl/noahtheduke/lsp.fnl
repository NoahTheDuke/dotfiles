(local utils (require "noahtheduke.utils"))
(import-macros {: callback : when-let} "noahtheduke.util-macros")

(each [_ name (ipairs [:Format :FOrmat])]
  (vim.api.nvim_create_user_command
    name
    (λ [] (vim.lsp.buf.format))
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

(vim.keymap.set "i" "<C-o>" (λ [] (vim.lsp.buf.signature_help {:border "rounded"}))
                (utils.ks-opts "show signature help"))

(vim.api.nvim_create_autocmd
  [:LspAttach]
  {:group (vim.api.nvim_create_augroup :lsp-completion {:clear true})
   :callback (callback [args]
               (when-let [client-id args.data.client_id]
                 (when (vim.lsp.get_client_by_id client-id)
                   (vim.lsp.semantic_tokens.enable false {:bufnr args.buf})
                   (vim.lsp.document_color.enable false {:bufnr args.buf})
                   (vim.lsp.inlay_hint.enable true {:bufnr args.buf})
                   (vim.lsp.completion.enable true
                                              client-id
                                              args.buf
                                              {:autotrigger true})
                   )))})

(vim.api.nvim_create_autocmd
  [:CursorHold]
  {:group (vim.api.nvim_create_augroup :lsp-cursor-hold {:clear true})
   :pattern "*"
   :callback (callback [_args]
               (vim.diagnostic.open_float {:header ""
                                           :scope "cursor"
                                           :focus false}))})	

(require "noahtheduke.lsp.clojure")

nil
