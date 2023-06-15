local nvim = require("vendor.nvim")

nvim.create_user_command("Scratch", "<cmd>Scratch<cr>", { nargs = 0 })

nvim.create_user_command("ScratchWithName", "<cmd>ScratchWithName<cr>", { nargs = 0 })

nvim.create_user_command("ScratchOpen", "<cmd>ScratchOpen<cr>", { nargs = 0 })
