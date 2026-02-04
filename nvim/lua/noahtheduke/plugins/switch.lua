-- [nfnl] fnl/noahtheduke/plugins/switch.fnl
local utils = require("noahtheduke.utils")
local function config()
  local augroup = vim.api.nvim_create_augroup("switches", {clear = true})
  local function _1_()
    do
      vim.b.switch_custom_definitions = {{["\"\\(\\k\\+\\)\""] = "'\\1", ["'\\(\\k\\+\\)"] = ":\\1", [":\\(\\k\\+\\)"] = "\"\\1\"\\2"}}
    end
    return nil
  end
  vim.api.nvim_create_autocmd({"FileType"}, {group = augroup, pattern = "fennel", callback = _1_})
  local function _2_()
    do
      vim.b.switch_custom_definitions = {{["\"\\(\\k\\+\\)\""] = "'\\1", ["#:\\(\\k\\+\\)"] = "\"\\1\"\\2", ["'\\(\\k\\+\\)"] = ":\\1", [":\\(\\k\\+\\)"] = "#:\\1"}}
    end
    return nil
  end
  return vim.api.nvim_create_autocmd({"FileType"}, {group = augroup, pattern = "lisp", callback = _2_})
end
--[[ (vim.print vim.b.switch_custom_definitions) (config) ]]
return {utils.dep("https://github.com/AndrewRadev/switch.vim", {config = config})}
