-- [nfnl] nvim/fnl/plugins/session-manager.fnl
local utils = require("utils")
local function _1_()
  local _2_, session_manager = pcall(require, "session_manager")
  local _3_, config = pcall(require, "session_manager.config")
  if (_2_ and _3_) then
    return session_manager.setup({autoload_mode = config.AutoloadMode.Disabled, autosave_only_in_session = false})
  else
    return nil
  end
end
return utils.dep("https://github.com/Shatur/neovim-session-manager", {dependencies = {"nvim-lua/plenary.nvim"}, config = _1_})
