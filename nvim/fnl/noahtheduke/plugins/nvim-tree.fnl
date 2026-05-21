(local utils (require "noahtheduke.utils"))
(import-macros {: when-require : when-let} "noahtheduke.util-macros")

(fn config []
  (when-require [nvim-tree :nvim-tree]
    (nvim-tree.setup)))

(comment
  (config))

[(utils.dep "https://github.com/nvim-tree/nvim-web-devicons.git")
 (utils.dep
   "https://github.com/nvim-tree/nvim-tree.lua.git"
   {:config config})]
