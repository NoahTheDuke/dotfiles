(local utils (require "noahtheduke.utils"))

;; json
(utils.dep
  "https://github.com/elzr/vim-json"
  {:ft "json"
   :config
   (fn []
     (set vim.g.vim_json_syntax_conceal 0))})
