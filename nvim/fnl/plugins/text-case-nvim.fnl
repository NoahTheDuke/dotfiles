(local utils (require :utils))

(fn config []
  (local (status-ok tc) (pcall require "textcase"))
  (when status-ok
    (tc.setup {})
    (local (status-ok telescope) (pcall require "telescope"))
    (when status-ok
      (telescope.load_extension "textcase"))))

(comment
  (config))

(utils.dep
  "https://github.com/johmsalas/text-case.nvim"
  {:dependencies ["https://github.com/nvim-telescope/telescope.nvim"]
   :config config})
