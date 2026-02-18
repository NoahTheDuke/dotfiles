(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ config []
  (when-require [tc :textcase]
    (tc.setup {})
    (when-require [telescope :telescope]
      (telescope.load_extension "textcase"))))

(comment
  (config))

[(utils.dep
   "https://github.com/nvim-telescope/telescope.nvim")
 (utils.dep
  "https://github.com/johmsalas/text-case.nvim"
  {:config config})]
