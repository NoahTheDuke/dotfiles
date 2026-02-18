-- [nfnl] fnl/noahtheduke/plugins/session-manager.fnl
local utils = require("noahtheduke.utils")
local function _1_()
  local errors_2_ = {}
  local _3_, session_manager
  local function _5_()
    return require("session_manager")
  end
  local function _6_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/session-manager.fnl:11", 2)
    else
    end
    return table.insert(errors_2_, debug.traceback(err_2_auto))
  end
  _3_, session_manager = xpcall(_5_, _6_)
  local _4_, config
  local function _8_()
    return require("session_manager.config")
  end
  local function _9_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/session-manager.fnl:11", 2)
    else
    end
    return table.insert(errors_2_, debug.traceback(err_2_auto))
  end
  _4_, config = xpcall(_8_, _9_)
  if (_3_ and _4_) then
    return session_manager.setup({autoload_mode = config.AutoloadMode.Disabled, autosave_only_in_session = false})
  else
    return vim.notify(errors_2_[1], vim.log.levels.ERROR)
  end
end
return {utils.dep("https://github.com/nvim-lua/plenary.nvim"), utils.dep("https://github.com/Shatur/neovim-session-manager", {config = _1_})}
