(local utils (require :noahtheduke.utils))
(import-macros  {: when-require} :noahtheduke.util-macros)

(fn config []
  (when-require [onedark "onedark"]
    (onedark.setup {:style :light})
    (onedark.load)))

[(utils.colorscheme
   "https://github.com/navarasu/onedark.nvim"
   {:config config})]
