(local utils (require "utils"))

(fn config []
  (local (status-ok autopairs) (pcall require "nvim-autopairs"))
  (when status-ok
    (autopairs.setup {:map_cr false
                      :check_ts true
                      :enable_check_bracket_line false
                      :break_undo false
                      :ts_config {:lua [ "string" ]
                                  :javascript [ "string" "template_string" ]}})
    (tset (. (autopairs.get_rules "'") 1) :not_filetypes [ "scheme" "lisp" "clojure" "ocaml"])
    (tset (. (autopairs.get_rules "`") 1) :not_filetypes [ "scheme" "lisp" "clojure" "ocaml"])))

(comment
  (config))

;; automatically create closing "" and () etc
(utils.dep
  "https://github.com/windwp/nvim-autopairs"
  {:config config})
