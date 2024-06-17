;; sexpr editing
(local utils (require "utils"))

(fn config []
  (local paredit (require "nvim-paredit"))
  (local common (require "nvim-paredit.utils.common"))
  (local langs (require "nvim-paredit.lang"))
  (local clj (require "nvim-paredit.lang.clojure"))
  (local ts (require "nvim-treesitter.ts_utils"))

  (fn enclosing-wrapper-maker [brackets placement]
    (fn []
      ;; If the node is a "form", then treat it like an element: (|1 2 3) -> (| (1 2 3))
      (if (clj.node_is_form (ts.get_node_at_cursor))
        (paredit.cursor.place_cursor
          (paredit.wrap.wrap_element_under_cursor (unpack brackets))
          {:placement placement
           :mode :insert})
        ;; Otherwise, wrap the surrounding form: (1 2| 3) -> (| (1 2 3))
        (paredit.cursor.place_cursor
          (paredit.wrap.wrap_enclosing_form_under_cursor (unpack brackets))
          {:placement placement
           :mode :insert}))))

  (fn wrapper-maker [brackets placement]
    (fn []
      (paredit.cursor.place_cursor
        (paredit.wrap.wrap_element_under_cursor (unpack brackets))
        {:placement placement
         :mode :insert})))

  (fn move-in-list [placement mode]
    (local lang (langs.get_language_api))
    (local current-element (paredit.wrap.find_element_under_cursor lang))

    (when current-element
      (local use-direct-parent (or (common.is_whitespace_under_cursor lang)
                                   (lang.node_is_comment (ts.get_node_at_cursor))))
      (var form (paredit.wrap.find_form current-element lang))
      (when (and (not use-direct-parent) (~= (form:type) :source))
        (set form (paredit.wrap.find_parend_form current-element lang)))

      (paredit.cursor.place_cursor
        form
        {: placement
         : mode})))

  (fn insert-in-list-head [] (move-in-list :inner_start :insert))
  (fn insert-in-list-tail [] (move-in-list :inner_end :insert))


  (paredit.setup
    {:use_default_keys true
     :filetypes [ :clojure :scheme :lisp :fennel ]
     :cursor_behaviour :follow
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

            ;; Wrap current form in given type enter insert mode at start or end
            "<localleader>w"
            [(wrapper-maker ["(" ")"] "inner_start")
             "Wrap element insert head"]

            "<localleader>W"
            [(wrapper-maker ["(" ")"] "inner_end")
             "Wrap element insert tail"]

            "<localleader>h"
            [insert-in-list-head
             "Enter insert mode at head of current form"]

            "<localleader>l"
            [insert-in-list-tail
             "Enter insert mode at tail of current form"] }}))

(comment
  (config))

[(utils.dep
   "https://github.com/julienvincent/nvim-paredit.git"
   {:config config})]
