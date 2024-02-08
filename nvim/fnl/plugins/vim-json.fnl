(local utils (require "utils"))

;; json
(utils.dep
  "https://github.com/elzr/vim-json"
  {:name "vim-json"
   :ft "json"
   :config
   (fn []
     (set vim.g.vim_json_syntax_conceal 0))})
