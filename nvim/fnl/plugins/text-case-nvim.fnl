(local utils (require :utils))
(import-macros {: when-require} :nvim/fnl/util-macros)

(fn config []
  (when-require [tc :textcase]
    (tc.setup {})
    (when-require [telescope :telescope]
      (telescope.load_extension "textcase"))))

(comment
  (config))

(utils.dep
  "https://github.com/johmsalas/text-case.nvim"
  {:dependencies ["https://github.com/nvim-telescope/telescope.nvim"]
   :config config})
