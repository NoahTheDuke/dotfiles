local nvim = require("vendor.nvim")

vim.opt.mouse = "a"

-- neovim-qt settings
if vim.g.GuiLoaded == 1 then
  vim.opt.showtabline = 2

  nvim.ex.GuiAdaptiveColor(1)
  nvim.ex.GuiAdaptiveFont(1)
  nvim.ex.GuiAdaptiveStyle("Fusion")
  nvim.ex.GuiFont_("FiraCode Nerd Font:h16:w57")
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

if nvim.g.gui_vimr then
  nvim.ex.VimRSetFontAndSize("Fira Code Retina Nerd Font Complete 14")
end
