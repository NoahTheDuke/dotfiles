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

highlight("Normal", colors.fg, colors.bg, nil)
highlight("NormalFloat", colors.fg, colors.bg, nil)

highlight("Comment", colors.comment, nil, 'italic')
highlight("Constant", colors.purple, nil, nil)
highlight("String", colors.yellow, nil, nil)
highlight("Character", colors.pink, nil, nil)
highlight("Number", colors.purple, nil, nil)
highlight("Boolean", colors.purple, nil, nil)
highlight("Float", colors.purple, nil, nil)
highlight("FloatBorder", colors.white, nil, nil)

highlight("Identifier", colors.fg, nil, nil)
highlight("Function", colors.green, nil, nil)

highlight("Statement", colors.pink, nil, nil)
highlight("Conditional", colors.pink, nil, nil)
highlight("Repeat", colors.pink, nil, nil)
highlight("Label", colors.pink, nil, nil)
highlight("Operator", colors.orange, nil, nil)
highlight("Keyword", colors.pink, nil, nil)
highlight("Keywords", colors.pink, nil, nil)
highlight("Exception", colors.pink, nil, nil)

highlight("PreProc", colors.pink, nil, nil)
highlight("Include", colors.pink, nil, nil)
highlight("Define", colors.pink, nil, nil)
highlight("Title", colors.cyan, nil, nil)
highlight("Macro", colors.orange, nil, nil)
highlight("PreCondit", colors.pink, nil, nil)
highlight("Type", colors.pink, nil, nil)
highlight("StorageClass", colors.pink, nil, nil)
highlight("Structure", colors.pink, nil, nil)
highlight("TypeDef", colors.pink, nil, nil)
highlight("Special", colors.fg, nil, nil)
highlight("SpecialKey", colors.comment, nil, 'italic')
highlight("SpecialComment", colors.cyan, nil, "italic")
highlight("Error", colors.bright_red, nil, nil)
highlight("Todo", colors.purple, nil, "bold,italic")
highlight("Underlined", colors.fg, nil, "underline")

highlight("Cursor", nil, nil, "reverse")
highlight("CursorColumn", nil, colors.black, "reverse")
highlight("CursorLineNr", colors.fg, nil, "bold")
