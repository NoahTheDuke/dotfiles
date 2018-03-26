{:user {
        ; :dependencies [[pjstadig/humane-test-output "0.8.3"]]
        ; :injections [(require 'pjstadig.humane-test-output)
        ;              (pjstadig.humane-test-output/activate!)]
        :plugins [[com.jakemccrary/lein-test-refresh "0.22.0"]
                  [lein-kibit "0.1.5"]]
        :test-refresh {:changes-only true
                       :quiet true}}}
