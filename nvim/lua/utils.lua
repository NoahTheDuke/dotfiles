local nvim = require "vendor.nvim"

local M = {}

function M.g_set(k, v)
  if nvim.fn.exists(k) == 0 then
    vim.g[k] = v
  end
end

function M.plugin_setup(mod, remote)
  if remote == nil then
    -- If plugin does not need "require" setup, then just set it up.
    require(mod)
    return
  end

  local remote_status = pcall(require, remote)
  if not remote_status then
    vim.notify_once(remote .. " is not downloaded.", vim.log.levels.ERROR)
    return
  end

  local local_config = require(mod)
  if type(local_config) == "table" then
    local_config.setup()
    return
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


return M
