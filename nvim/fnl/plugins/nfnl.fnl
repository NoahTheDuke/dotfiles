(local utils (require "utils"))

(utils.dep
  "https://github.com/Olical/nfnl"
  {:config
   (fn []
     (let [nfnl (require "nfnl")]
         (nfnl.setup {})))})
