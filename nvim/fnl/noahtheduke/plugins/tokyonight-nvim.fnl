(local utils (require :noahtheduke.utils))
(import-macros  {: when-require} :noahtheduke.util-macros)

(fn config []
  (when-require [tokyonight "tokyonight"]
    (tokyonight.setup)))

[(utils.colorscheme
   "https://github.com/folke/tokyonight.nvim"
   {:config config})]
