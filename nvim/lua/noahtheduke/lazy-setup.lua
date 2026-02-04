-- [nfnl] fnl/noahtheduke/lazy-setup.fnl
local lazy = require("lazy")
return lazy.setup({spec = {import = "noahtheduke/plugins"}, change_detection = {enabled = true, notify = false}, lockfile = "~/dotfiles/nvim/lazy-lock.json", concurrency = 5, ui = {border = "rounded"}, defaults = {version = "*"}})
