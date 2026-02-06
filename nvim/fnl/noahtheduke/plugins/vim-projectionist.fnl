(local utils (require "noahtheduke.utils"))

(fn config []
  (set vim.g.projectionist_heuristics
       {"deps.edn"
        {"src/*.clj" {:type "source"
                      :alternate "test/{}_test.clj"}
         "test/*_test.clj" {:type "test"
                       :alternate "src/{}.clj"}}}))

(comment
  (config))

;; :A etc
[(utils.dep
   "https://github.com/tpope/vim-projectionist"
   {:name "vim-projectionist"
    :config config})]
