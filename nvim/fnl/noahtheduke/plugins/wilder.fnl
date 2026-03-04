(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

;; Prettify wild menu
[(utils.dep
   "https://github.com/gelguy/wilder.nvim"
   {:config
    (λ []
      (when-require [wilder "wilder"]
        (wilder.setup {:modes [ ":" "/" "?" ]})))})]
