-- [nfnl] Compiled from fnl/plugins/session-manager.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local session_manager = require("session_manager")
  local config = require("session_manager.config")
  return session_manager.setup({autoload_mode = config.AutoloadMode.Disabled})
end
return utils.dep("https://github.com/Shatur/neovim-session-manager", {name = "neovim-session-manager", dependencies = {"nvim-lua/plenary.nvim"}, config = _1_})
