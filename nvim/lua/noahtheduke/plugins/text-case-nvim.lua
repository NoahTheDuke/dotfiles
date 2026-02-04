-- [nfnl] fnl/noahtheduke/plugins/text-case-nvim.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, tc
  local function _3_()
    return require("textcase")
  end
  local function _4_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/text-case-nvim.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, tc = xpcall(_3_, _4_)
  if _2_ then
    tc.setup({})
    local errors_6_ = {}
    local _7_, telescope
    local function _8_()
      return require("telescope")
    end
    local function _9_(err_2_auto)
      if (nil == err_2_auto) then
        _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/text-case-nvim.fnl:7", 2)
      else
      end
      return table.insert(errors_6_, debug.traceback(err_2_auto))
    end
    _7_, telescope = xpcall(_8_, _9_)
    if _7_ then
      return telescope.load_extension("textcase")
    else
      return vim.notify(errors_6_[1], vim.log.levels.ERROR)
    end
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/johmsalas/text-case.nvim", {dependencies = {"https://github.com/nvim-telescope/telescope.nvim"}, config = config})
