(local utils (require "utils"))

; -- clojure
(utils.dep
  "https://github.com/bfontaine/zprint.vim"
  {:name "zprint.vim"
   :ft "clojure"
   :config
   (fn []
     (set vim.g.zprint#make_autocmd 0)
     (vim.api.nvim_create_user_command "ZPrint" "call zprint#apply()" {}))})
