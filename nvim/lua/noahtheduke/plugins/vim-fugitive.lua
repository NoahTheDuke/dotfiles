-- [nfnl] fnl/noahtheduke/plugins/vim-fugitive.fnl
local utils = require("noahtheduke.utils")
local function str_split(str, sep)
  local sep0 = (sep or "%s")
  local t = {}
  for s, _ in str:gmatch(("([^" .. sep0 .. "]+)")) do
    table.insert(t, s)
  end
  return t
end
_G.tangled_handler = function(opts)
  local path = opts.path
  local line1 = opts.line1
  local line2 = opts.line2
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
local function tangled_config()
  return vim.cmd("\n    if !exists('g:fugitive_browse_handlers')\n      let g:fugitive_browse_handlers = []\n    endif\n    if index(g:fugitive_browse_handlers, function('TangledHandler')) < 0\n      call insert(g:fugitive_browse_handlers, function('TangledHandler'))\n    endif\n    ")
end
local function _3_()
  return tangled_config()
end
return {utils.dep("https://github.com/tpope/vim-fugitive", {name = "vim-fugitive", config = _3_})}
