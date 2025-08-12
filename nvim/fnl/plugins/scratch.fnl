(local utils (require "utils"))

[(utils.dep
   "https://github.com/LintaoAmons/scratch.nvim"
   {:cmd ["Scratch" "ScratchOpen" "ScratchWithName"]
    :config (fn []
              (local scratch (require "scratch"))
              (scratch.setup
                {:filetypes [ :clj :lua :js :md :sh :ts :txt ]}))})]
