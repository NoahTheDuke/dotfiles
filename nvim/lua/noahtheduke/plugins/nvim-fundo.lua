-- [nfnl] fnl/noahtheduke/plugins/nvim-fundo.fnl
local utils = require("noahtheduke.utils")
local function _1_()
  do
    local errors_2_ = {}
    local _3_, fundo
    local function _4_()
      return require("fundo")
    end
    local function _5_(err_2_auto)
      if (nil == err_2_auto) then
        _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/nvim-fundo.fnl:7", 2)
      else
      end
      return table.insert(errors_2_, debug.traceback(err_2_auto))
    end
    _3_, fundo = xpcall(_4_, _5_)
    if _3_ then
      fundo.install()
      fundo.setup()
    else
      vim.notify(errors_2_[1], vim.log.levels.ERROR)
    end
  end
  return nil
end
return {utils.dep("https://github.com/kevinhwang91/nvim-fundo", {config = _1_}), utils.dep("https://github.com/kevinhwang91/promise-async")}
