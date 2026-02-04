(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke/util-macros")

(fn config []
  (when-require [jj "jj"]
    (jj.setup {})))

(comment
  (config))

;; jj stuff
;; :J [blah blah]
[(utils.dep
   "https://github.com/NicolasGB/jj.nvim"
   {:config config})]
