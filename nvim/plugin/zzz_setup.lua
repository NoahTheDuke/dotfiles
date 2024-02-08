local status_ok, alpha = pcall(require, "plugins.alpha")
if status_ok then
  alpha.config(nil, nil, true)
end
