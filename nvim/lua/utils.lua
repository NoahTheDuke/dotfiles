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
  return vim.api.nvim_command(table.concat(vim.tbl_flatten({...}), " "))
end
local function dep(name, args)
  if (args ~= nil) then
    table.insert(args, 1, name)
    return args
  else
    return {name}
  end
end
return {g_set = g_set, dep = dep, nvim_ex = nvim_ex}
