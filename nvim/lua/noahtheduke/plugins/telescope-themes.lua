-- [nfnl] fnl/noahtheduke/plugins/telescope-themes.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, telescope
  local function _3_()
    return require("telescope")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/telescope-themes.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, telescope = xpcall(_3_, _4_)
  if _2_ then
    return telescope.load_extension("themes")
  elseif next(errors_1_) then
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/andrew-george/telescope-themes", {config = config})
