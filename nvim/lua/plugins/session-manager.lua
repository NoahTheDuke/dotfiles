-- :SessionManager
return {
  "https://github.com/Shatur/neovim-session-manager",
  name = "neovim-session-manager",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("session_manager").setup({
      autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
    })
  end,
}
