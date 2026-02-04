(local utils (require "noahtheduke.utils"))
(import-macros {: callback} "noahtheduke.util-macros")

(λ config []
  (let [augroup (vim.api.nvim_create_augroup "switches" {:clear true})]
    (vim.api.nvim_create_autocmd
      ["FileType"]
      {:group augroup
       :pattern "fennel"
       :callback (callback []
                   (set vim.b.switch_custom_definitions
                        [{"\"\\(\\k\\+\\)\"" "'\\1"
                          "'\\(\\k\\+\\)" ":\\1"
                          ":\\(\\k\\+\\)" "\"\\1\"\\2"}]))})

    (vim.api.nvim_create_autocmd
      ["FileType"]
      {:group augroup
       :pattern "lisp"
       :callback (callback []
                   (set vim.b.switch_custom_definitions
                        [{"\"\\(\\k\\+\\)\"" "'\\1"
                          "#:\\(\\k\\+\\)" "\"\\1\"\\2"
                          "'\\(\\k\\+\\)" ":\\1"
                          ":\\(\\k\\+\\)" "#:\\1"}]))})))

(comment
  (vim.print vim.b.switch_custom_definitions)
  (config))

;; gs: "abc" -> 'abc -> :abc
[(utils.dep
   "https://github.com/AndrewRadev/switch.vim"
   {:config config})]
