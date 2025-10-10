(local utils (require :utils))
(import-macros {: when-require} :nvim/fnl/util-macros)

(fn config []
  (when-require [ocaml :ocaml]
    (ocaml.setup {})))

(comment
  (config))

[(utils.dep
   "https://github.com/tarides/ocaml.nvim"
   {:ft "ocaml"
    :config config})]

