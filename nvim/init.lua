-- [nfnl] init.fnl
local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
  if (vim.v.shell_error ~= 0) then
    vim.api.nvim_echo({{"Failed to clone lazy.nvim:\n", "ErrorMsg"}, {out, "WarningMsg"}, {"\nPress any key to exit"}}, true, {})
    vim.fn.getchar()
  else
  end
else
end
vim.opt.rtp:prepend(lazypath)
require("noahtheduke.options")
require("noahtheduke.keymaps")
require("noahtheduke.autocmds")
require("noahtheduke.lazy-setup")
require("noahtheduke.lsp")
require("noahtheduke.vim-plugins")
require("noahtheduke.rename")
require("noahtheduke.statusline")
local _base_lua_path = vim.fs.joinpath(vim.fn.stdpath("config"), "lua")
local function glob_require(path)
  local function _3_(f)
    return ("lua" == vim.fs.ext(f))
  end
  for _, f in ipairs(vim.fs.find(_3_, {type = "file", path = path, limit = math.huge})) do
    local relfilename = f:gsub("lua/", ""):gsub("%.lua", "")
    local basename = vim.fs.basename(relfilename)
    if ((basename ~= "init") and (basename:sub(1, 1) ~= "_")) then
      require(relfilename)
    else
    end
  end
  return nil
end
glob_require("lua/noahtheduke/conf")
return nil
