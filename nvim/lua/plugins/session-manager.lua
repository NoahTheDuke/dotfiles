-- [nfnl] nvim/fnl/plugins/session-manager.fnl
local utils = require("utils")
local function _1_()
  local session_manager = require("session_manager")
  local config = require("session_manager.config")
  return session_manager.setup({autoload_mode = config.AutoloadMode.Disabled, autosave_only_in_session = false})
end
return utils.dep("https://github.com/Shatur/neovim-session-manager", {dependencies = {"nvim-lua/plenary.nvim"}, config = _1_})
