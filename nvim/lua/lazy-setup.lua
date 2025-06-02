-- [nfnl] nvim/fnl/lazy-setup.fnl
local lazy = require("lazy")
return lazy.setup({spec = {import = "plugins"}, change_detection = {enabled = true, notify = false}, lockfile = "~/dotfiles/nvim/lazy-lock.json", concurrency = 5, ui = {border = "rounded"}})
