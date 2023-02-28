local nvim = require("vendor.nvim")

vim.opt.mouse = "a"

-- neovim-qt settings
if vim.g.GuiLoaded == 1 then
  vim.opt.showtabline = 2

  nvim.ex.GuiAdaptiveColor(1)
  nvim.ex.GuiAdaptiveFont(1)
  nvim.ex.GuiAdaptiveStyle("Fusion")
  nvim.ex.GuiFont_("FiraCode Nerd Font:h16")
  nvim.ex.GuiPopupmenu(0)
  nvim.ex.GuiRenderLigatures(1)
  nvim.ex.GuiScrollBar(1)
  nvim.ex.GuiTabline(1)

  vim.keymap.set("n", "<RightMouse>", ":call GuiShowContextMenu()<CR>", {
    silent = true,
  })
  vim.keymap.set("i", "<RightMouse>", "<Esc>:call GuiShowContextMenu()<CR>", {
    silent = true,
  })
  vim.keymap.set("x", "<RightMouse>", ":call GuiShowContextMenu()<CR>gv", {
    silent = true,
  })
  vim.keymap.set("s", "<RightMouse>", "<C-G>:call GuiShowContextMenu()<CR>gv", {
    silent = true,
  })

  nvim.create_user_command(
    "GuiNewWindow",
    [[ call GuiNewWindow("<args>") ]],
    { nargs = 1 }
  )
end

if vim.g.neovide == true then
  vim.opt.guifont = "Fira Code Retina:h16,FiraCode Nerd Font:h16"
  vim.g.neovide_cursor_animation_length = 0.04
end
