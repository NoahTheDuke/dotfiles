vim.cmd [[set runtimepath^=$HOME/personal/coc-clojure]]

-- plugins come first so all user settings override
require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.colorscheme"
require "user.tele"
require "user.autocmds"
