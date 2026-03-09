(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

[(utils.dep
   "https://github.com/ibhagwan/fzf-lua")
 (utils.dep
   "https://github.com/LintaoAmons/scratch.nvim"
   {:config (λ []
              (when-require [scratch "scratch"]
                (scratch.setup
                  {:use_telescope true
                   :file_picker "telescope"
                   :filetypes [ :clj :lua :js :md :sh :ts :txt ]})))})]
