(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ config
  []
  (when-require [url-open :url-open]
    (url-open.setup
      {:open_only_when_cursor_on_url false
       :highlight_url {:all_urls {:enabled false}
                       :cursor_move {:enabled false}}})))

(comment
  (config))

(utils.dep
  "https://github.com/sontungexpt/url-open"
  {:cmd ["OpenUrlUnderCursor" "URLOpenUnderCursor"]
   :config config})
