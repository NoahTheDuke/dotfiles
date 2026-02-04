; Bootstrap lazy.nvim

(local lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim"))

(when (not ((. (or vim.uv vim.loop) :fs_stat) lazypath))
  (let [lazyrepo "https://github.com/folke/lazy.nvim.git"
        out (vim.fn.system ["git" "clone" "--filter=blob:none" "--branch=stable" lazyrepo lazypath])]
    (when (not= vim.v.shell_error 0)
      (vim.api.nvim_echo
        [["Failed to clone lazy.nvim:\n" "ErrorMsg"]
         [out "WarningMsg"]
         ["\nPress any key to exit"]]
        true {})
      (vim.fn.getchar))))

(vim.opt.rtp:prepend lazypath)

(require "noahtheduke.options")
(require "noahtheduke.keymaps")
(require "noahtheduke.autocmds")
(require "noahtheduke.lazy-setup")
(require "noahtheduke.lsp")
(require "noahtheduke.statusline")

nil
