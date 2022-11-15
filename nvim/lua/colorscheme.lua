local colo = function(colorscheme)
  local status_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
  if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!", vim.log.levels.ERROR)
    return
  end
end

colo("onedark")
colo("dracula")
