;; sexpr editing
(local utils (require :utils))
(import-macros {: when-require} :nvim/fnl/util-macros)

(fn config []
  (when-require [paredit "nvim-paredit"
                 ts-context "nvim-paredit.treesitter.context"
                 ts-forms "nvim-paredit.treesitter.forms"
                 ts-utils "nvim-paredit.treesitter.utils"
                 whitespace "nvim-paredit.api.whitespace"]
    (fn insert-in-list [placement]
      (fn []
        (let [context (ts-context.create_context)]
          (if (not context) (lua "return"))

          (let [current-element (ts-forms.get_node_root context.node context)]
            (if (not current-element) (lua "return"))

            (let [use-direct-parent (or (whitespace.is_whitespace_under_cursor)
                                        (ts-utils.node_is_comment current-element context))]
              (var form (ts-forms.find_nearest_form current-element
                                                    {:captures context.captures
                                                     :use-source false}))
              (when (not form) (lua "return"))

              (when (and (not use-direct-parent) (not= (form:type) "source"))
                (set form (ts-utils.find_local_root current-element))
                (if (not (and form (ts-forms.node_is_form form context)))
                  (lua "return")))

              (paredit.cursor.place_cursor form {:placement placement
                                                 :mode :insert}))))))

    (fn enclosing-wrapper-maker [brackets placement]
      (fn []
        (let [context (ts-context.create_context)]
          (if (not context) (lua "return"))

          (let [current-element (ts-forms.get_node_root context.node context)]
            (if (not current-element) (lua "return"))

            (if (ts-forms.node_is_form current-element context)
              (let [buf (vim.api.nvim_get_current_buf)]
                (paredit.cursor.place_cursor
                  (paredit.wrap.wrap_element buf current-element (unpack brackets))
                  {:placement placement
                   :mode :insert}))
              (paredit.cursor.place_cursor
                (paredit.wrap.wrap_enclosing_form_under_cursor (unpack brackets))
                {:placement placement
                 :mode :insert}))))))

    (fn wrapper-maker [brackets placement]
      (fn []
        (paredit.cursor.place_cursor
          (paredit.wrap.wrap_element_under_cursor (unpack brackets))
          {:placement placement
           :mode :insert})))

    (paredit.setup
      {:use_default_keys true
       :filetypes [ :clojure :scheme :lisp :fennel :basilisp ]
       :cursor_behaviour :follow
       ; :extensions { :basilisp clj }
       :keys {
              ;; Wrap enclosing form in given type enter insert mode at start or end

              "<localleader>i"
              [(enclosing-wrapper-maker ["( " ")"] "inner_start")
               "Wrap form round insert head"]

              "<localleader>I"
              [(enclosing-wrapper-maker ["(" " )"] "inner_end")
               "Wrap form round insert tail"]

              "<localleader>[" ;]
              [(enclosing-wrapper-maker ["[" "]"] "inner_start")
               "Wrap form square insert head"]

              "<localleader>]"
              [(enclosing-wrapper-maker ["[" "]"] "inner_end")
               "Wrap form square insert tail"]

              "<localleader>{" ;}
              [(enclosing-wrapper-maker ["{" "}"] "inner_start")
               "Wrap form curly insert head"]

              "<localleader>}"
       [(enclosing-wrapper-maker ["{" "}"] "inner_end")
        "Wrap form curly insert tail"]

       "<localleader>w"
       [(wrapper-maker ["(" ")"] "inner_start")
        "Wrap element with (), insert head"]

       "<localleader>W"
       [(wrapper-maker ["(" ")"] "inner_end")
        "Wrap element with (), insert tail"]

       "<localleader>e[" ;]
       [(wrapper-maker ["[" "]"] "inner_start")
        "Wrap element with [], insert head"]

       "<localleader>e]"
       [(wrapper-maker ["[" "]"] "inner_end")
        "Wrap element with [], insert tail"]

       "<localleader>e{" ;}
       [(wrapper-maker ["{" "}"] "inner_start")
        "Wrap element with {}, insert head"]

       "<localleader>e}"
      [(wrapper-maker ["{" "}"] "inner_end")
       "Wrap element with {}, insert tail"]

      "<localleader>h"
      [(insert-in-list "inner_start")
       "Enter insert mode at head of current form"]

      "<localleader>l"
      [(insert-in-list "inner_end")
       "Enter insert mode at tail of current form"]
      }
      })))

(comment
  (config))

[(utils.dep
   "https://github.com/julienvincent/nvim-paredit.git"
   {:config config})]
