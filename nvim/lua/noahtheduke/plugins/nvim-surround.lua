-- [nfnl] fnl/noahtheduke/plugins/nvim-surround.fnl
local utils = require("noahtheduke.utils")
local function _1_()
  local errors_2_ = {}
  local _3_, nvim_surround
  local function _4_()
    return require("nvim-surround")
  end
  local function _5_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-surround.fnl:9", 2)
    else
    end
    return table.insert(errors_2_, debug.traceback(err_2_auto))
  end
  _3_, nvim_surround = xpcall(_4_, _5_)
  if _3_ then
    return nvim_surround.setup({})
  else
    return vim.notify(errors_2_[1], vim.log.levels.ERROR)
  end
end
return utils.dep("https://github.com/kylechui/nvim-surround", {config = _1_})
