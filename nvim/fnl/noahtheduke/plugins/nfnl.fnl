(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ config []
  (when-require [nfnl "nfnl"]
    (nfnl.setup {})))

(comment
  (config))

(utils.dep
  "https://github.com/Olical/nfnl"
  {:ft "fennel"
   :commit "fecf731e02bc51d88372c4f992fe1ef0c19c02ae"
   :config config})
