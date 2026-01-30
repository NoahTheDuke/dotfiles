-- [nfnl] nvim/fnl/utils.fnl
local function g_set(k, v)
  if (0 == vim.api.nvim_call_function("exists", k)) then
    vim.g[k] = v
    return nil
  else
    return nil
  end
end
local function nvim_ex(...)
  return vim.api.nvim_command(table.concat(vim.iter({...}):flatten():totable(), " "))
end
local function dep(name, args)
  if (args ~= nil) then
    table.insert(args, 1, name)
    return args
  else
    return {name}
  end
end
local function fennel_includeexpr(mdl)
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
  local mod_info = vim.loader.find(mdl0)[1]
  return ((mod_info and mod_info.modpath) or mdl0)
end
return {g_set = g_set, dep = dep, nvim_ex = nvim_ex, fennel_includeexpr = fennel_includeexpr}
