(local utils (require "utils"))

(fn conjure []
  ;; conjure settings
  (set vim.g.conjure#extract#tree_sitter#enabled true)
  (set vim.g.conjure#log#hud#ignore_low_priority true)
  (set vim.g.conjure#log#wrap true)
  (set vim.g.conjure#mapping#def_word false)
  (set vim.g.conjure#mapping#doc_word false)

  ;; clojure client settings
  (set vim.g.conjure#client#clojure#nrepl#eval#raw_out true)
  (set vim.g.conjure#client#clojure#nrepl#test#raw_out false)
  (set vim.g.conjure#client#clojure#nrepl#test#current_form_names
       ["deftest"
        "defexpect"
        "describe"])
  (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)

  ;; runner stuff

  (local runners (require "conjure.client.clojure.nrepl.action"))

  (set runners.test-runners.lazytest
       {:namespace "lazytest.runner.repl"
        :all-fn "run-all-tests"
        :ns-fn "run-tests"
        :single-fn "run-test-var"
        :default-call-suffix ""
        :name-prefix "(resolve '"
        :name-suffix ")"})
  (set vim.g.conjure#client#clojure#nrepl#test#call_suffix "")
  (set vim.g.conjure#client#clojure#nrepl#test#runner "clojure")
  ; (set vim.g.conjure#client#clojure#nrepl#test#call_suffix "{:kaocha/color? false :capture-output? false}")
  ; (set vim.g.conjure#client#clojure#nrepl#test#runner "kaocha")
  )

(comment
  (conjure))

[(utils.dep
   "https://github.com/Olical/conjure"
   {:config conjure})]
