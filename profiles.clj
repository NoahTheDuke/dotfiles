{:user {:plugins [[cider/cider-nrepl "0.17.0"]
                  [com.jakemccrary/lein-test-refresh "0.22.0"]
                  [jonase/eastwood "0.2.5"]
                  [lein-cljfmt "0.5.7"]
                  [lein-topology "0.2.0"]
                  [lein-gossip "0.1.0-SNAPSHOT"]
                  [lein-kibit "0.1.5"]
                  [venantius/ultra "0.5.2"]]
        :eastwood {:exclude-linters [:no-ns-form-found]}
        :test-refresh {:changes-only true
                       :quiet true
                       :watch-dirs ["test"]}}}
