(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ config []
  (when-require [blink "blink.cmp"]
    (blink.setup {:keymap {:preset :default}
                  :cmdline {:enabled false}
                  :completion {:menu {:auto_show true}}})))

(comment
  (config))

(utils.dep
  "https://github.com/saghen/blink.cmp"
  {:config config})
