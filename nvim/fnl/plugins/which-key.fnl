(local utils (require "utils"))

;; :WhichKey
(utils.dep
  "https://github.com/folke/which-key.nvim"
  {:name "which-key.nvim"
   :config
   (fn []
     (let [which (require "which-key")]
       (which.setup)))})
