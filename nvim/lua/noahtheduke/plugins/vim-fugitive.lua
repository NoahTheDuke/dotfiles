-- [nfnl] fnl/noahtheduke/plugins/vim-fugitive.fnl
local utils = require("noahtheduke.utils")
local function str_split(str, sep)
  if (nil == sep) then
    _G.error("Missing argument sep on fnl/noahtheduke/plugins/vim-fugitive.fnl:3", 2)
  else
  end
  if (nil == str) then
    _G.error("Missing argument str on fnl/noahtheduke/plugins/vim-fugitive.fnl:3", 2)
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
    _G.error("Missing argument opts on fnl/noahtheduke/plugins/vim-fugitive.fnl:10", 2)
  else
  end
  local path = opts.path
  local remote = opts.remote
  local commit = opts.commit
  local path0 = (path or "")
  local path1 = path0:gsub("^/", "")
  if remote:find("tangled.sh") then
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
  if (nil == vim.g.fugitive_browse_handlers) then
    vim.g.fugitive_browse_handlers = {}
  else
  end
  vim.cmd("\n    if index(g:fugitive_browse_handlers, function('TangledHandler')) < 0\n      call insert(g:fugitive_browse_handlers, function('TangledHandler'))\n    endif\n    ")
  local function _7_(opts)
    return vim.fn.system({"open", opts.fargs[1]})
  end
  return vim.api.nvim_create_user_command("Browse", _7_, {nargs = 1})
end
return {utils.dep("https://github.com/tpope/vim-fugitive", {name = "vim-fugitive", config = config}), utils.dep("https://github.com/shumphrey/fugitive-gitlab.vim.git")}
