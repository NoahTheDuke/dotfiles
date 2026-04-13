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
(require "noahtheduke.vim-plugins")
(require "noahtheduke.rename")
(require "noahtheduke.statusline")

(local _base-lua-path (vim.fs.joinpath (vim.fn.stdpath :config) :lua))

(fn glob-require [path]
  (each [_ f (ipairs (vim.fs.find (fn [f] (= "lua" (vim.fs.ext f)))
                                {:type :file
                                 :path path
                                 :limit math.huge}))]
    (let [relfilename (-> (f:gsub "lua/" "")
                          (: :gsub "%.lua" ""))
          basename (vim.fs.basename relfilename)]
      (when (and (not= basename "init") (not= (basename:sub 1 1) "_"))
        (require relfilename)))))

(glob-require "lua/noahtheduke/conf")

nil
