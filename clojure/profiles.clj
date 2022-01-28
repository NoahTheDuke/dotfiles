{:user {
        :plugins [
                  [com.github.clojure-lsp/lein-clojure-lsp "1.1.5"]
                  [cider/cider-nrepl "0.24.0"]
                  [com.github.liquidz/antq "1.3.0"]
                  [rewrite-clj "0.6.1"]
                  [lein-pprint "1.3.2"]
                  [com.jakemccrary/lein-test-refresh "0.25.0"]
                  [jonase/eastwood "0.8.1"]
                  [lein-kibit "0.1.7"]
                  [lein-cljfmt "0.6.7"]
                  [lein-topology "0.2.0"]
                  [lein-bikeshed "0.5.2"]
                  [lein-ancient "0.6.15"]
                  [lein-cloverage "1.1.2"]
                  [lein-ns-dep-graph "0.2.0-SNAPSHOT"]
                  [org.clojure/tools.namespace "0.3.0-alpha4"]
                  [com.github.clojure-lsp/lein-clojure-lsp "0.1.2"]
                  ]
        :eastwood {:exclude-linters [:no-ns-form-found]}
        :test-refresh {:changes-only true
                       :quiet true
                       :watch-dirs ["test"]}
        :aliases {
                  "var-graph" ["with-profile" "+clj-usage-graph" "run"
                               "-m" "com.gfredericks.clj-usage-graph/var-graph"]
                  "namespace-graph" ["with-profile" "+clj-usage-graph" "run"
                                     "-m" "com.gfredericks.clj-usage-graph/namespace-graph"]
                  "outdated" ["run" "-m" "antq.core"]
                  }
        }
 :clj-usage-graph {:dependencies [[com.gfredericks/clj-usage-graph "0.3.0"]]}}
