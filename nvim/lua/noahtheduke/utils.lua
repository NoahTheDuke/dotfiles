-- [nfnl] fnl/noahtheduke/utils.fnl
local M = {}
M.nvim_ex = function(...)
  return vim.api.nvim_command(table.concat(vim.iter({...}):flatten():totable(), " "))
end
M.dep = function(url, _3fargs)
  if (nil == url) then
    _G.error("Missing argument url on fnl/noahtheduke/utils.fnl:24", 2)
  else
  end
  local dep
  if (_3fargs ~= nil) then
    table.insert(_3fargs, 1, url)
    dep = _3fargs
  else
    dep = {url}
  end
  return dep
end
M.colorscheme = function(url, _3fargs)
  if (nil == url) then
    _G.error("Missing argument url on fnl/noahtheduke/utils.fnl:31", 2)
  else
  end
  local base = {url, priority = 1000, lazy = false}
  if (_3fargs ~= nil) then
    return vim.tbl_extend("keep", base, _3fargs)
  else
    return base
  end
end
M.fennel_includeexpr = function(mdl)
  if (nil == mdl) then
    _G.error("Missing argument mdl on fnl/noahtheduke/utils.fnl:39", 2)
  else
  end
  do
    local mdl0 = mdl:gsub("%.", "/")
    local root = (vim.fs.root(vim.api.nvim_buf_get_name(0), "lua") or vim.fn.getcwd())
    for _, fname in ipairs({mdl0, vim.fs.joinpath(root, "fnl", mdl0)}) do
      for _0, suf in ipairs({".fnl", ".fnlm"}) do
        local path = (fname .. suf)
        if vim.uv.fs_stat(path) then
          return path
        else
        end
      end
    end
  end
  local mod_info = vim.loader.find(mdl)[1]
  return ((mod_info and mod_info.modpath) or mdl)
end
--[[ (fennel_includeexpr "noahtheduke.util-macros") ]]
M["ks-opts"] = function(desc)
  if (nil == desc) then
    _G.error("Missing argument desc on fnl/noahtheduke/utils.fnl:54", 2)
  else
  end
  return {silent = true, noremap = true, desc = desc}
end
return M
