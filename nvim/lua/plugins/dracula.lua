local dracula = require("dracula")
local colors = dracula.colors()

dracula.setup({
  overrides = {
    Normal = { fg = colors.fg, bg = colors.bg },
    Comment = { fg = colors.comment },

    Constant = { fg = colors.purple },
    String = { fg = colors.yellow },
    Character = { fg = colors.purple },
    Number = { fg = colors.purple },
    Boolean = { fg = colors.purple },
    Float = { fg = colors.purple },

    Identifier = { fg = colors.fg, bg = colors.bg },
    Function = { fg = colors.green },

    Statement = { fg = colors.pink },
    Conditional = { fg = colors.pink },
    Repeat = { fg = colors.pink },
    Label = { fg = colors.pink },
    Operator = { fg = colors.orange },
    Keyword = { fg = colors.pink },
    Exception = { fg = colors.pink },

    PreProc = { fg = colors.orange },
    Include = { fg = colors.orange },
    Define = { fg = colors.cyan },
    Macro = { fg = colors.orange },
    PreCondit = { fg = colors.orange },

    Type = { fg = colors.cyan },
    StorageClass = { fg = colors.cyan },
    Structure = { fg = colors.cyan },
    Typedef = { fg = colors.cyan },

    Special = { fg = colors.pink },
    SpecialKey = { fg = colors.red },
    SpecialChar = { fg = colors.orange },
    Tag = { fg = colors.fg },
    Delimiter = { fg = colors.fg },
    SpecialComment = { fg = colors.comment, bg = nil },
    Debug = { fg = colors.fg },

    Ignore = { fg = colors.comment },

    -- Coc Semantic Highlighting
    CocSemEvent = { fg = colors.fg, bg = colors.bg },
    CocSemMacro = { fg = colors.orange },
    CocSemVariable = { link = "Identifier" },
    CocHighlightText = { bg = colors.bg, undercurl = true, sp = colors.yellow },

    -- TreeSitter Highlighting
    ['@character.special'] = { fg = colors.orange },
    ['@constant.builtin'] = { fg = colors.purple },
    ['@function.macro'] = { fg = colors.orange },
    ['@operator'] = { fg = colors.orange },
    ['@punctuation.special'] = { fg = colors.orange },
    ['@string.regex'] = { fg = colors.purple },
    ['@variable.builtin'] = { fg = colors.cyan },
  },
})
