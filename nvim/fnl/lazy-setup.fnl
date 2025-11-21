(local lazy (require "lazy"))

(lazy.setup
  {:spec {:import "plugins"}
   :change_detection {:enabled true
                      :notify false}
   :lockfile "~/dotfiles/nvim/lazy-lock.json"
   :concurrency 5
   :ui {:border "rounded"}
   :defaults {:version "*"}})
