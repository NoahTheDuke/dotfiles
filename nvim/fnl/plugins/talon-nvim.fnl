(local utils (require :utils))

(fn config []
  (local (status-ok talon) (pcall require "talon"))
  (when status-ok
    (talon.setup)
    (set vim.opt.cmdheight 1)))

(comment
  (config))

(utils.dep
  "https://github.com/hands-free-vim/talon.nvim"
  {:config config})
