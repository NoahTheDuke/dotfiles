-- [nfnl] Compiled from fnl/lazy-setup.fnl by https://github.com/Olical/nfnl, do not edit.
local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "--single-branch", "https://github.com/folke/lazy.nvim.git", lazypath})
else
end
do end (vim.opt.runtimepath):prepend(lazypath)
local lazy = require("lazy")
return lazy.setup("plugins", {change_detection = {enabled = true, notify = false}, lockfile = "~/dotfiles/nvim/lazy-lock.json", concurrency = 5, ui = {border = "rounded"}})
