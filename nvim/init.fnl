; Bootstrap lazy.nvim

(local lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim"))

(when (not ((. (or vim.uv vim.loop) :fs_stat) lazypath))
  (local lazyrepo "https://github.com/folke/lazy.nvim.git")
  (local out (vim.fn.system ["git" "clone" "--filter=blob:none" "--branch=stable" lazyrepo lazypath]))
  (when (~= vim.v.shell_error 0)
    (vim.api.nvim_echo
      [["Failed to clone lazy.nvim:\n" "ErrorMsg"]
       [out "WarningMsg"]
       ["\nPress any key to exit"]]
      true {})
    (vim.fn.getchar)))

(vim.opt.rtp:prepend lazypath)

(require :options)
(require :keymaps)
(require :autocmds)
(require :lazy-setup)
(require :lsp)
(require :statusline)

nil
