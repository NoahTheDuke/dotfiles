(local utils (require :utils))
(import-macros {: when-require} :nvim/fnl/util-macros)

;; :WhichKey
(utils.dep
  "https://github.com/folke/which-key.nvim"
  {:config
   (fn []
     (when-require [which "which-key"]
       (which.setup)))})
