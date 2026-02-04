(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

;; :WhichKey
(utils.dep
  "https://github.com/folke/which-key.nvim"
  {:config
   (λ []
     (when-require [which "which-key"]
       (which.setup)))})
