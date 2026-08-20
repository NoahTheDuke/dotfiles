(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

;; Prettify wild menu
[(utils.dep
   "https://github.com/gelguy/wilder.nvim"
   {:config
    (λ []
      (when-require [wilder "wilder"]
        (wilder.setup {:modes [ ":" "/" "?" ]})
        (wilder.set_option
          :pipeline
          [(wilder.branch (wilder.cmdline_pipeline)
                          (wilder.search_pipeline))])
        (wilder.set_option
          :renderer
          (wilder.wildmenu_renderer
            {:highligher (wilder.basic_highlighter)}))))})]
