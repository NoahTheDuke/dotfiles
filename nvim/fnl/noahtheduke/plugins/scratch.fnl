(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke/util-macros")

[(utils.dep
   "https://github.com/LintaoAmons/scratch.nvim"
   {:cmd ["Scratch" "ScratchOpen" "ScratchWithName"]
    :config (fn []
              (when-require [scratch "scratch"]
                (scratch.setup
                  {:filetypes [ :clj :lua :js :md :sh :ts :txt ]})))})]
