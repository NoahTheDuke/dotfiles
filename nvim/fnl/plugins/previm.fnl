(local utils (require "utils"))

;; :PreviewOpen
[(utils.dep
   "https://github.com/previm/previm"
   {:config
    (fn []
      (set vim.g.previm_open_cmd "firefox"))})]
