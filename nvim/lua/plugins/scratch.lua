local scratch = require("scratch")
local nvim = require("vendor.nvim")

scratch.setup {
  filetypes = { "clj", "md", "lua" },
}

nvim.create_user_command("Scratch", function()
  scratch.scratch()
end, { nargs = 0 })

nvim.create_user_command("ScratchWithName", function()
  scratch.scratchWithName()
end, { nargs = 0 })

nvim.create_user_command("ScratchOpen", function()
  scratch.openScratch()
end, { nargs = 0 })
