local nvim = require "vendor.nvim"

local M = {}

function M.g_set(k, v)
  if nvim.fn.exists(k) == 0 then
    vim.g[k] = v
  end
end

return M
