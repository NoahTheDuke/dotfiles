(local utils (require :noahtheduke.utils))
(import-macros  {: when-require} :noahtheduke.util-macros)

(fn config []
  (when-require [kanagawa "kanagawa"]
    (kanagawa.setup)))

[(utils.colorscheme
   "https://github.com/rebelot/kanagawa.nvim"
   {:config config})]
