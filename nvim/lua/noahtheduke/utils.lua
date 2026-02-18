-- [nfnl] fnl/noahtheduke/utils.fnl
local function nvim_ex(...)
  return vim.api.nvim_command(table.concat(vim.iter({...}):flatten():totable(), " "))
end
local function dep(name, _3fargs)
  if (nil == name) then
    _G.error("Missing argument name on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/utils.fnl:22", 2)
  else
  end
  local dep0
  if (_3fargs ~= nil) then
    table.insert(_3fargs, 1, name)
    dep0 = _3fargs
  else
    dep0 = {name}
  end
  return dep0
end
local function fennel_includeexpr(mdl)
  if (nil == mdl) then
    _G.error("Missing argument mdl on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/utils.fnl:29", 2)
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
local function ks_opts(desc)
  if (nil == desc) then
    _G.error("Missing argument desc on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/utils.fnl:44", 2)
  else
  end
  return {silent = true, noremap = true, desc = desc}
end
return {dep = dep, nvim_ex = nvim_ex, fennel_includeexpr = fennel_includeexpr, ["ks-opts"] = ks_opts}
