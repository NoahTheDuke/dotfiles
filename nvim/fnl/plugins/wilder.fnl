(local utils (require :utils))
(import-macros {: when-require} :nvim/fnl/util-macros)

;; Prettify wild menu
[(utils.dep
   "https://github.com/gelguy/wilder.nvim"
   {:config
    (fn []
      (when-require [wilder "wilder"]
        (wilder.setup {:modes [ ":" "/" "?" ]})))})]
