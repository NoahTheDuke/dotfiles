-- [nfnl] nvim/fnl/plugins/vim-fugitive.fnl
local utils = require("utils")
local function str_split(str, sep)
  local sep0 = (sep or "%s")
  local t = {}
  for s, _ in str:gmatch(("([^" .. sep0 .. "]+)")) do
    table.insert(t, s)
  end
  return t
end
vim.g.tangled_handler = function(opts)
  local path = opts["path"]
  local line1 = opts["line1"]
  local line2 = opts["line2"]
  local remote = opts["remote"]
  local commit = opts["commit"]
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
vim.cmd("\nfunction! TangledHandler(opts, ...)\n  return g:tangled_handler(a:opts)\nendfunction\n")
local function tangled_config()
  if not vim.g.fugitive_browse_handlers then
    vim.cmd("let g:fugitive_browse_handlers = []")
  else
  end
  return vim.cmd("call insert(g:fugitive_browse_handlers, function('TangledHandler'))")
end
local function _4_()
  return tangled_config()
end
return {utils.dep("https://github.com/tpope/vim-fugitive", {name = "vim-fugitive", config = _4_})}
