(local utils (require :utils))

(fn conjure []
  (local core (require :nfnl.core))
  (local eval (require :conjure.eval))
  (local extract (require :conjure.extract))
  (local log (require :conjure.log))
  (local parse (require :conjure.client.clojure.nrepl.parse))
  (local server (require :conjure.client.clojure.nrepl.server))
  (local str (require :nfnl.string))
  (local ui (require :conjure.client.clojure.nrepl.ui))

  (fn time-current-form [extra-opts]
    (let [form (extract.form {})]
      (when form
        (let [{: content : range} form]
          (eval.eval-str
            (core.merge
              {:code (str.join ["(time (dotimes [_ 1000] " content "))"])
               :range range
               :origin :current-form}
              extra-opts))
          form))))

  (vim.keymap.set :n :<leader>et #(time-current-form {}))

  (fn ns-unmap [extra-opts]
    (let [form (extract.form {:root? true})]
      (when form
        (let [{: content : range} form
              var-name (-> (parse.strip-meta content)
                           (str.split "%s+")
                           (core.second))
              current-ns (extract.context)]
          (when var-name
            (log.append [(core.str "; Unmapping " var-name)] {:break? true})
            (server.eval
              {:code (core.str "(ns-unmap (the-ns '" current-ns ") '" var-name ")")}
              #(ui.display-result
                 $1
                 {:simple-out? true
                  :raw-out? true
                  :ignore-nil? false})))
          form))))
  (vim.api.nvim_create_user_command :Unmap ns-unmap {})

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
        "defdescribe"
        "defn"])
  (set vim.g.conjure#client#clojure#nrepl#connection#auto_repl#enabled false)

  ;; runner stuff

  (local runners (require "conjure.client.clojure.nrepl.action"))

  (set runners.test-runners.lazytest
       {:namespace "lazytest.repl"
        :all-fn "run-all-tests"
        :ns-fn "run-tests"
        :single-fn "run-test-var"
        :default-call-suffix "{:reporter [lazytest.reporters/nested]}"
        :name-prefix "(resolve '"
        :name-suffix ")"})

  (set vim.g.conjure#client#clojure#nrepl#test#call_suffix "")
  (set vim.g.conjure#client#clojure#nrepl#test#runner "clojure")
  ; (set vim.g.conjure#client#clojure#nrepl#test#call_suffix "{:kaocha/color? false :capture-output? false}")
  ; (set vim.g.conjure#client#clojure#nrepl#test#runner "kaocha")

  ; (set vim.g.conjure#client#clojure#nrepl#test#call_suffix "")
  ; (set vim.g.conjure#client#clojure#nrepl#test#runner "lazytest")
  )

(comment
  (conjure))

[(utils.dep
   "https://github.com/Olical/conjure.git"
   {:branch "main"
    :config conjure})

 (utils.dep
   "https://github.com/walterl/conjure-macroexpand"
   {:dependencies [ "Olical/conjure" ]})

 (utils.dep
   "https://github.com/walterl/conjure-locstack"
   {:dependencies [ "Olical/conjure" ]})]
