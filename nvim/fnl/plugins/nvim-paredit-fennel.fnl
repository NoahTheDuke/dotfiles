(local utils (require "utils"))

(utils.dep
  "julienvincent/nvim-paredit-fennel"
  {:dependencies ["julienvincent/nvim-paredit"]
   :ft ["fennel"]
   :config
   (fn []
     (local dep (require "nvim-paredit-fennel"))
     (dep.setup))})
