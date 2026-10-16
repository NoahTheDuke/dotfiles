-- [nfnl] fnl/noahtheduke/plugins/md_toc.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, md_toc
  local function _3_()
    return require("md_toc")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/md_toc.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, md_toc = xpcall(_3_, _4_)
  if _2_ then
    return md_toc.setup({auto_update = true, fence_text = "toc", list_marker = "-", style = "gfm", telekasten_integration = true})
  elseif next(errors_1_) then
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  else
    return nil
  end
end
return utils.dep("https://github.com/dan-lynam/md_toc", {config = config, commit = "ec9f70ddd224e37258876b47aec858d5788622da"})
