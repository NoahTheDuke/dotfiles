-- [nfnl] fnl/noahtheduke/plugins/csvview-nvim.fnl
local utils = require("noahtheduke.utils")
return utils.dep("https://github.com/hat0uma/csvview.nvim", {opts = {cmd = {"CsvViewEnable", "CsvViewDisable", "CsvViewToggle"}, keymaps = {jump_next_field_end = {"<Tab>", mode = {"n", "v"}}, jump_prev_field_end = {"<S-Tab>", mode = {"n", "v"}}, jump_next_row = {"<Enter>", mode = {"n", "v"}}, jump_prev_row = {"<S-Enter>", mode = {"n", "v"}}}}})
