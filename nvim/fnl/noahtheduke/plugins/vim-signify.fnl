(local utils (require "noahtheduke.utils"))

(fn config []
  (set vim.g.signify_skip {:vcs {:allow ["git"]}}))

(comment
  (config))

[(utils.dep
   "https://github.com/mhinz/vim-signify"
   {:config config})]
