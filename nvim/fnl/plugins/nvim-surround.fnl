(local utils (require "utils"))

;; ysaw, ds[]
(utils.dep
  "https://github.com/kylechui/nvim-surround"
  {:config
   (fn []
     (let [nvim-surround (require "nvim-surround")]
       (nvim-surround.setup {})))})
