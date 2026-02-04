-- [nfnl] fnl/noahtheduke/plugins/text-case-nvim.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, tc
  local function _3_()
    return require("textcase")
  end
  local function _4_(err_1_auto)
    return table.insert(errors_1_, debug.traceback(err_1_auto))
  end
  _2_, tc = xpcall(_3_, _4_)
  if _2_ then
    tc.setup({})
    local errors_5_ = {}
    local _6_, telescope
    local function _7_()
      return require("telescope")
    end
    local function _8_(err_1_auto)
      return table.insert(errors_5_, debug.traceback(err_1_auto))
    end
    _6_, telescope = xpcall(_7_, _8_)
    if _6_ then
      return telescope.load_extension("textcase")
    else
      return vim.notify(errors_5_[1], vim.log.levels.ERROR)
    end
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/johmsalas/text-case.nvim", {dependencies = {"https://github.com/nvim-telescope/telescope.nvim"}, config = config})
