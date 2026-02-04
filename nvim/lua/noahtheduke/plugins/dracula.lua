-- [nfnl] fnl/noahtheduke/plugins/dracula.fnl
local utils = require("noahtheduke.utils")
local function config()
  do
    local dracula = require("dracula")
    local colors = dracula.colors()
    dracula.setup({overrides = {Normal = {fg = colors.fg, bg = colors.bg}, Terminal = {fg = colors.fg, bg = colors.bg}, Comment = {fg = colors.comment}, Constant = {fg = colors.purple}, String = {fg = colors.yellow}, Character = {fg = colors.purple}, Number = {fg = colors.purple}, Boolean = {fg = colors.purple}, Float = {fg = colors.purple}, Identifier = {fg = colors.fg, bg = colors.bg}, Function = {fg = colors.green}, Statement = {fg = colors.pink}, Conditional = {fg = colors.pink}, Repeat = {fg = colors.pink}, Label = {fg = colors.pink}, Operator = {fg = colors.orange}, Keyword = {fg = colors.pink}, Exception = {fg = colors.pink}, PreProc = {fg = colors.orange}, Include = {fg = colors.orange}, Define = {fg = colors.cyan}, Macro = {fg = colors.orange}, PreCondit = {fg = colors.orange}, Type = {fg = colors.cyan}, StorageClass = {fg = colors.cyan}, Structure = {fg = colors.cyan}, Typedef = {fg = colors.cyan}, Special = {fg = colors.pink}, SpecialKey = {fg = colors.red}, SpecialChar = {fg = colors.orange}, Tag = {fg = colors.fg}, Delimiter = {fg = colors.fg}, SpecialComment = {fg = colors.comment, bg = nil}, Debug = {fg = colors.fg}, Ignore = {fg = colors.comment}, ["@character"] = {link = "Character"}, ["@comment"] = {link = "Comment"}, ["@constant.builtin"] = {link = "Constant"}, ["@function.call"] = {link = "Function"}, ["@function.macro"] = {link = "Macro"}, ["@operator"] = {link = "Operator"}, ["@punctuation.special"] = {fg = colors.orange}, ["@string"] = {link = "String"}, ["@string.regexp"] = {fg = colors.purple}, ["@string.special"] = {fg = colors.purple}, ["@string.special.symbol"] = {fg = colors.pink}, ["@variable.builtin"] = {fg = colors.cyan}, ["@lsp.type.macro"] = {link = "Macro"}, DiagnosticUnnecessary = {undercurl = true}, User1 = {fg = colors.bg, bg = colors.purple, bold = true}, User2 = {fg = colors.fg, bg = colors.comment}, User3 = {fg = colors.fg, bg = colors.selection}}})
  end
  vim.cmd.colorscheme("dracula")
  return nil
end
return {utils.dep("https://github.com/Mofiqul/dracula.nvim", {priority = 1000, config = config})}
