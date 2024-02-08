(local utils (require "utils"))

;; gS gJ
(utils.dep
  "https://github.com/AndrewRadev/splitjoin.vim"
  {:name "splitjoin.vim"
   :config
   (fn []
     (set vim.g.splitjoin_trailing_comma 1))})
