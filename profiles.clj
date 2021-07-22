{:user {
        :dependencies [
                       [rewrite-clj "0.6.1"]
                       ]
        :plugins [
                  [com.jakemccrary/lein-test-refresh "0.24.1"]
                  [jonase/eastwood "0.8.1"]
                  [lein-kibit "0.1.7"]
                  [lein-cljfmt "0.6.7"]
                  [lein-topology "0.2.0"]
                  [lein-bikeshed "0.5.2"]
                  [lein-ancient "0.6.15"]
                  [lein-cloverage "1.1.2"]
                  [lein-ns-dep-graph "0.2.0-SNAPSHOT"]
                  [org.clojure/tools.namespace "0.3.0-alpha4"]
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
                  }
        }
 :clj-usage-graph {:dependencies [[com.gfredericks/clj-usage-graph "0.3.0"]]}}
