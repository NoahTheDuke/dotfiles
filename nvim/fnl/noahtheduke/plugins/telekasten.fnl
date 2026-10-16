(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ config []
  (when-require [telekasten "telekasten"]
    (telekasten.setup
      {:home (vim.fn.expand "~/personal/telekasten")})))


[(utils.dep
   "https://github.com/nvim-telekasten/calendar-vim")
 (utils.dep
   "https://github.com/nvim-telekasten/telekasten.nvim"
   {:config config})]
