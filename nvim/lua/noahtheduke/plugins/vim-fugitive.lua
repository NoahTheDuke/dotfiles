-- [nfnl] fnl/noahtheduke/plugins/vim-fugitive.fnl
local utils = require("noahtheduke.utils")
local function str_split(str, sep)
  if (nil == sep) then
    _G.error("Missing argument sep on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/vim-fugitive.fnl:3", 2)
  else
  end
  if (nil == str) then
    _G.error("Missing argument str on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/vim-fugitive.fnl:3", 2)
  else
  end
  local sep0 = (sep or "%s")
  local t = {}
  for s, _ in str:gmatch(("([^" .. sep0 .. "]+)")) do
    table.insert(t, s)
  end
  return t
end
_G.tangled_handler = function(opts)
  if (nil == opts) then
    _G.error("Missing argument opts on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/vim-fugitive.fnl:11", 2)
  else
  end
  local path = opts.path
  local remote = opts.remote
  local commit = opts.commit
  local path0 = (path or "")
  local path1 = path0:gsub("^/", "")
  if (nil ~= remote:find("tangled.sh")) then
    local parts = {unpack(str_split(remote, ":"), 2)}
    local project_path = ("@" .. table.concat(parts, "/") .. "/")
    local project_url = ("https://tangled.sh/" .. project_path)
    local url = (project_url .. "blob/" .. commit)
    if ("" == path1) then
      return url
    else
      return (url .. "/" .. path1)
    end
  else
    return nil
  end
end
vim.cmd("\nfunction! TangledHandler(opts, ...)\n  return v:lua.tangled_handler(a:opts)\nendfunction\n")
local function config()
  return vim.cmd("\n    if !exists('g:fugitive_browse_handlers')\n      let g:fugitive_browse_handlers = []\n    endif\n    if index(g:fugitive_browse_handlers, function('TangledHandler')) < 0\n      call insert(g:fugitive_browse_handlers, function('TangledHandler'))\n    endif\n    ")
end
return {utils.dep("https://github.com/tpope/vim-fugitive", {name = "vim-fugitive", config = config})}
