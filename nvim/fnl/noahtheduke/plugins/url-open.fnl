(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ config []
  (when-require [url-open "url-open"
                 handlers "url-open.modules.handlers"]
    (let [opts {:open_only_when_cursor_on_url false
                :highlight_url {:all_urls {:enabled false}
                                :cursor_move {:enabled false}}}]
      (url-open.setup opts)
      (vim.api.nvim_create_user_command
        :OpenUrlUnderCursor #(handlers.open_url opts)
        {:nargs 0}))))

(comment
  (config))

(utils.dep
  "https://github.com/sontungexpt/url-open"
  {:cmd ["OpenUrlUnderCursor" "URLOpenUnderCursor"]
   :config config})
