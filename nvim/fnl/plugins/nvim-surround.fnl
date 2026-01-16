(local utils (require :utils))
(import-macros {: when-require} :nvim/fnl/util-macros)

;; ysaw, ds[]
(utils.dep
  "https://github.com/kylechui/nvim-surround"
  {:config
   (fn []
     (when-require [nvim-surround "nvim-surround"]
       (nvim-surround.setup {})))})
