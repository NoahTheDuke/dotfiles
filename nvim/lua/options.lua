local set = vim.opt

set.autochdir = false
set.backup = false
set.clipboard:prepend("unnamedplus")
set.cmdheight = 1
set.colorcolumn = "+1"
set.completeopt = { "menuone", "noselect" }
set.conceallevel = 0
set.expandtab = true
set.foldenable = false
set.formatoptions = {
  ["1"] = true, -- Don't break a line after a one-letter word.  It's broken before it instead (if possible).
  ["c"] = true, -- Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
  ["j"] = true, -- Where it makes sense, remove a comment leader when joining lines.
  ["o"] = true, -- Automatically insert comment character when pressing "o" or "O" in normal mode
  ["n"] = true, -- When formatting text, recognize numbered lists.
  ["q"] = true, -- Allow formatting of comments with "gq".
  ["r"] = true, -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
  ["t"] = true, -- Auto-wrap text using 'textwidth'
}
set.list = true
set.listchars = {
  eol = "¬",
  nbsp = "+",
  tab = "> ",
  trail = "~",
}
set.modelines = 0
set.mouse = "a"
set.number = true
set.pumheight = 10
set.scrolloff = 2
set.shiftwidth = 4
set.shortmess = {
  ["A"] = true, -- no "ATTENTION" message when an existing swap file is found
  ["c"] = true, -- don't give ins-completion-menu messages
  ["F"] = true, -- don't give the file info when editing a file
  ["f"] = true, -- use "(3 of 5)" instead of "(file 3 of 5)"
  ["i"] = true, -- use "[noeol]" instead of "[Incomplete last line]"
  ["l"] = true, -- use "999L, 888B" instead of "999 lines, 888 bytes"
  ["n"] = true, -- use [New] instead of [New file]
  ["O"] = true, -- message for reading a file overwrites any previous message
  ["o"] = true, -- overwrite message for writing a file when reading a file
  ["T"] = true, -- truncate messages in the middle if they are too long to fit on the command line
  ["t"] = true, -- truncate file message
  ["x"] = true, -- [dos] instead of [dos format]
}
set.showmatch = true
set.showmode = false
set.showtabline = 0
set.signcolumn = "yes"
set.softtabstop = -1
set.splitbelow = true
set.splitright = true
set.swapfile = false
set.synmaxcol = 1000
set.tabstop = 4
set.termguicolors = true
set.textwidth = 88
set.title = true
set.undofile = true
set.updatetime = 300
set.visualbell = true
set.whichwrap = {
  ["b"] = true, --  <BS>    Normal and Visual
  ["s"] = true, --  <Space> Normal and Visual
  ["h"] = true, --  "h"     Normal and Visual
  ["l"] = true, --  "l"     Normal and Visual
  ["<"] = true, --  <Left>  Normal and Visual
  [">"] = true, --  <Right> Normal and Visual
  ["["] = true, --  <Left>  Insert and Replace
  ["]"] = true, --  <Right> Insert and Replace
}
set.wildignore = { "*\\tmp\\*", "*\\target\\*", "*\\out\\*" }
set.wildignorecase = true

vim.g.loaded_netrwPlugin = 1
