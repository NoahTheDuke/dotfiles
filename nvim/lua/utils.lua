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
local function map(f, coll)
  local tbl_26_ = {}
  local i_27_ = 0
  for _, v in ipairs(coll) do
    local val_28_ = f(v)
    if (nil ~= val_28_) then
      i_27_ = (i_27_ + 1)
      tbl_26_[i_27_] = val_28_
    else
    end
  end
  return tbl_26_
end
local function filter(pred, coll)
  local tbl_26_ = {}
  local i_27_ = 0
  for _, v in ipairs(coll) do
    local val_28_
    if pred(v) then
      val_28_ = v
    else
      val_28_ = nil
    end
    if (nil ~= val_28_) then
      i_27_ = (i_27_ + 1)
      tbl_26_[i_27_] = val_28_
    else
    end
  end
  return tbl_26_
end
return {g_set = g_set, dep = dep, nvim_ex = nvim_ex, map = map, filter = filter}
