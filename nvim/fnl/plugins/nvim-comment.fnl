(local utils (require "utils"))

;; gcc
(utils.dep
  "https://github.com/terrortylor/nvim-comment"
  {:name "nvim-comment"
   :config
   (fn []
     (let [nvim-comment (require "nvim_comment")]
       (nvim-comment.setup {:comment_empty false})))})
