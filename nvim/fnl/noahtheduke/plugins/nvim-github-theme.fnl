(local utils (require :noahtheduke.utils))
(import-macros  {: when-require} :noahtheduke.util-macros)

(fn config []
  (when-require [github_theme "github_theme"]
    (github_theme.setup)))

[(utils.colorscheme
   "https://tangled.org/noahbogart.com/nvim-github-theme"
   {:config config})]
