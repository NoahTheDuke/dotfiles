(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ config []
  (when-require [ocaml :ocaml]
    (ocaml.setup {})))

(comment
  (config))

[(utils.dep
   "https://github.com/tarides/ocaml.nvim"
   {:ft "ocaml"
    :config config})]

