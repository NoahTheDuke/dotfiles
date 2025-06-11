-- [nfnl] nvim/fnl/ginit.fnl
local utils = require("utils")
vim.opt.mouse = "a"
if (1 == vim.g.GuiLoaded) then
  vim.opt.showtabline = 2
  utils.nvim_ex("GuiAdaptiveColor", 1)
  utils.nvim_ex("GuiAdaptiveColor", 2)
  utils.nvim_ex("GuiAdaptiveFont", 2)
  utils.nvim_ex("GuiAdaptiveStyle", 2)
  utils.nvim_ex("GuiFont!", 2)
  utils.nvim_ex("GuiPopupmenu", 2)
  utils.nvim_ex("GuiRenderLigatures", 2)
  utils.nvim_ex("GuiScrollBar", 2)
  utils.nvim_ex("GuiTabline", 2)
  vim.keymap.set("n", "<RightMouse>", ":call GuiShowContextMenu()<CR>", {silent = true})
  vim.keymap.set("i", "<RightMouse>", "<Esc>:call GuiShowContextMenu()<CR>", {silent = true})
  vim.keymap.set("x", "<RightMouse>", ":call GuiShowContextMenu()<CR>gv", {silent = true})
  vim.keymap.set("s", "<RightMouse>", "<C-G>:call GuiShowContextMenu()<CR>gv", {silent = true})
  vim.api.nvim_create_user_command("GuiNewWindow", "call GuiNewWindow(\"<args>\")", {nargs = 1})
else
end
if (vim.g.neovide == true) then
  vim.opt.guifont = "Fira Code Retina:h16"
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0
  return nil
else
  return nil
end
