-- [nfnl] fnl/noahtheduke/plugins/nvim-tree.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, nvim_tree
  local function _3_()
    return require("nvim-tree")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/nvim-tree.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, nvim_tree = xpcall(_3_, _4_)
  if _2_ then
    return nvim_tree.setup()
  elseif next(errors_1_) then
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  else
    return nil
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/nvim-tree/nvim-web-devicons.git"), utils.dep("https://github.com/nvim-tree/nvim-tree.lua.git", {config = config})}
