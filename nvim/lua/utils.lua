local nvim = require "vendor.nvim"

local M = {}

function M.g_set(k, v)
  if nvim.fn.exists(k) == 0 then
    vim.g[k] = v
  end
end

function M.indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end

function M.invertTable(t)
  local out = {}
  for k, v in pairs(t) do
    out[v] = k
  end
  return out
end

function M.dep(name, ...)
  local args = {...}
  table.insert(args, 1, name)
  return args
end

return M
