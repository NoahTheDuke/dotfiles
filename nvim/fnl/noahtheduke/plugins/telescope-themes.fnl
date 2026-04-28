(local utils (require :noahtheduke.utils))
(import-macros {: when-require} :noahtheduke.util-macros)

(λ config []
  (when-require [telescope "telescope"]
    (telescope.load_extension "themes")))

(comment
  (config))

(utils.dep
  "https://github.com/andrew-george/telescope-themes"
  {:config config})
