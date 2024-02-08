(local lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim"))
(if (not (vim.loop.fs_stat lazypath))
  (vim.fn.system
    ["git"
     "clone"
     "--filter=blob:none"
     "--single-branch"
     "https://github.com/folke/lazy.nvim.git"
     lazypath]))
(vim.opt.runtimepath:prepend lazypath)

(local lazy (require "lazy"))
(lazy.setup
  "plugins" {:change_detection {:enabled true
                                :notify false}
             :lockfile "~/dotfiles/nvim/lazy-lock.json"
             :concurrency 5
             :ui {:border "rounded"}})
