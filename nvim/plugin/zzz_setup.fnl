(import-macros {: when-require} "noahtheduke.util-macros")

(when-require [alpha "noahtheduke.plugins.alpha"]
  (alpha.config nil nil true))
