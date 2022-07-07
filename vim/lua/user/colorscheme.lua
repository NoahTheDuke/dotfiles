local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local highlight = function(group, fg, bg, attr)
  fg = fg and "guifg=" .. fg or "guifg=NONE"
  bg = bg and "guibg=" .. bg or "guibg=NONE"
  attr = attr and "gui=" ..attr or "gui=NONE"

  vim.api.nvim_command("highlight " .. group .. " ".. fg .. " " .. bg .. " ".. attr)
end

local colors = require('dracula').colors()

highlight("Keyword", colors.pink)
highlight("Function", colors.green)
highlight("Delimiter", colors.fg)
