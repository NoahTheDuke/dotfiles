(local utils (require "utils"))

(utils.dep
  "https://github.com/Olical/nfnl"
  {:ft "fennel"
   :commit "fecf731e02bc51d88372c4f992fe1ef0c19c02ae"
   :config
   (fn []
     (let [nfnl (require "nfnl")]
       (nfnl.setup {})))})
