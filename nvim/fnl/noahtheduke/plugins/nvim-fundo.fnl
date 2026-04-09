(local utils (require "noahtheduke.utils"))
(import-macros {: callback : when-require} "noahtheduke.util-macros")

[(utils.dep
   "https://github.com/kevinhwang91/nvim-fundo"
   {:config (callback []
              (when-require [fundo "fundo"]
                (fundo.install)
                (fundo.setup)))})
 (utils.dep
   "https://github.com/kevinhwang91/promise-async")]
