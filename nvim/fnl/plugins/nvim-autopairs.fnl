(local utils (require "utils"))


;; automatically create closing "" and () etc
(utils.dep
  "https://github.com/windwp/nvim-autopairs"
  {:config
   (fn []
     (local autopairs (require "nvim-autopairs"))
     (autopairs.setup {:map_cr false
                       :check_ts true
                       :enable_check_bracket_line false
                       :break_undo false
                       :ts_config {:lua [ "string" ]
                                   :javascript [ "string" "template_string" ]}})
     (tset (. (autopairs.get_rules "'") 1) :not_filetypes [ "scheme" "lisp" "clojure" ])
     (tset (. (autopairs.get_rules "`") 1) :not_filetypes [ "scheme" "lisp" "clojure" ]))})
