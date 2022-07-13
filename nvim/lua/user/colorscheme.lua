local nvim = require "vendor.nvim"

local colorscheme = "dracula"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local highlight = function(group, fg, bg, attr)
  fg = fg and "guifg=" .. fg or "guifg=NONE"
  bg = bg and "guibg=" .. bg or "guibg=NONE"
  attr = attr and "gui=" .. attr or "gui=NONE"

  nvim.command("highlight! " .. group .. " " .. fg .. " " .. bg .. " " .. attr)
end

local colors = require('dracula').colors()

highlight("Comment", colors.comment)

highlight("Constant", colors.purple)
highlight("String", colors.yellow)
highlight("Character", colors.purple)
highlight("Number", colors.purple)
highlight("Boolean", colors.purple)
highlight("Float", colors.purple)

highlight("Identifier", colors.fg, colors.bg)
highlight("Function", colors.green)

highlight("Statement", colors.pink)
highlight("Conditional", colors.pink)
highlight("Repeat", colors.pink)
highlight("Label", colors.pink)
highlight("Operator", colors.orange)
highlight("Keyword", colors.pink)
highlight("Exception", colors.pink)

highlight("PreProc", colors.orange)
highlight("Include", colors.orange)
highlight("Define", colors.cyan)
highlight("Macro", colors.orange)
highlight("PreCondit", colors.orange)

highlight("Type", colors.cyan)
highlight("StorageClass", colors.cyan)
highlight("Structure", colors.cyan)
highlight("Typedef", colors.cyan)

highlight("Special", colors.pink)
highlight("SpecialChar", colors.orange)
highlight("Tag", colors.fg)
highlight("Delimiter", colors.fg)
highlight("SpecialComment", colors.comment, nil, "italic")
highlight("Debug", colors.fg)

highlight("Ignore", colors.comment)


local hilink = function(from, to)
  nvim.command("highlight! link " .. from .. " " .. to)
end

-- Coc Semantic Highlighting
hilink("CocSemEvent", "Identifier")
hilink("CocSemMacro", "Macro")
hilink("CocSemVariable", "Identifier")

-- TreeSitter Highlighting
hilink("TSCharacterSpecial", "SpecialChar")
hilink("TSFunctionMacro", "Macro")
hilink("TSPunctSpecial", "SpecialChar")
hilink("TSStringRegex", "Constant")
hilink("TSVariableBuiltin", "Identifier")
