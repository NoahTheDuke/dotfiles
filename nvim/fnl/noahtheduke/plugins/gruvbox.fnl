(local utils (require :noahtheduke.utils))
(import-macros  {: when-require} :noahtheduke.util-macros)

(fn config []
  (when-require [gruvbox "gruvbox"]
    (gruvbox.setup)))

(utils.colorscheme
  "https://github.com/ellisonleao/gruvbox.nvim"
  {:config config})
