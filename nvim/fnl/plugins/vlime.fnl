(local utils (require "utils"))

;; common lisp
[(utils.dep
   "https://github.com/vlime/vlime"
   {:ft "lisp"
    :config
    (fn [plugin]
      (vim.opt.rtp:append (.. plugin.dir "/vim")))})]
