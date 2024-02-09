(local utils (require :utils))

;; Prettify wild menu
[(utils.dep
   "https://github.com/gelguy/wilder.nvim"
   {:config
    (fn []
      (let [wilder (require "wilder")]
        (wilder.setup {:modes [ ":" "/" "?" ]})))})]
