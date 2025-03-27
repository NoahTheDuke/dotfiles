-- [nfnl] Compiled from fnl/lazy-setup.fnl by https://github.com/Olical/nfnl, do not edit.
local lazy = require("lazy")
return lazy.setup({spec = {import = "plugins"}, change_detection = {enabled = true, notify = false}, lockfile = "~/dotfiles/nvim/lazy-lock.json", concurrency = 5, ui = {border = "rounded"}})
