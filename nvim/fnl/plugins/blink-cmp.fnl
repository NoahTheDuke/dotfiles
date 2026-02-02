(local utils (require :utils))
(import-macros {: when-require} :nvim/fnl/util-macros)

(fn config []
  (when-require [blink "blink.cmp"]
    (blink.setup {:keymap {:preset :default}
                  :cmdline {:completion {:menu {:auto_show (fn [_ctx] (= ":" (vim.fn.getcmdtype)))}}
                            :keymap {"<CR>" ["accept_and_enter" "fallback"]}}
                  :menu {:auto_show true}})))

(comment
  (config))

(utils.dep
  "https://github.com/saghen/blink.cmp"
  {:config config})
