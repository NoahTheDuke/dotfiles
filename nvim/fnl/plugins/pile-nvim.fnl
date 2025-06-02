(local utils (require :utils))

(fn config []
  (local pile (require :pile))
  (pile.setup)
  (vim.api.nvim_set_keymap "n" "<localleader>pt" ":PileToggle<CR>" {:noremap true
                                                                    :silent true}))

(comment
  (config))

[(utils.dep
   "https://github.com/shabaraba/pile.nvim"
   {:dependencies ["https://github.com/MunifTanjim/nui.nvim"]
    :config config})]
