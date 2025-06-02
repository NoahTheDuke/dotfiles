(local utils (require "utils"))

(fn config
  []
  (local (status-ok url-open) (pcall require "url-open"))
  (when status-ok
    (url-open.setup
      {:open_only_when_cursor_on_url false
       :highlight_url {}})))

(comment
  (config))

(utils.dep
  "https://github.com/sontungexpt/url-open"
  {:event "VeryLazy"
   :cmd "URLOpenUnderCursor"
   :config config})
