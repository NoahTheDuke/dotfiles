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
   :commit "f39a7ec6fe0ace2b2ea108ce04d954549e36c76d"
   :config config})
