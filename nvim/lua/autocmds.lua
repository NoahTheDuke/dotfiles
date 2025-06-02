-- [nfnl] nvim/fnl/autocmds.fnl
vim.cmd("\n  augroup filetypes\n    autocmd Filetype gitcommit setlocal spell textwidth=80\n    autocmd BufNewFile,BufReadPost *.axvw set filetype=xml\n    autocmd BufNewFile,BufReadPost *.md set filetype=markdown\n    autocmd BufNewFile,BufReadPost *.asd set filetype=lisp\n    autocmd BufNewFile,BufReadPost *.asm set filetype=z80\n    autocmd TermOpen * setlocal nospell nonumber norelativenumber\n    autocmd TermOpen,BufEnter term://* startinsert\n  augroup END\n  ")
vim.cmd("\n  augroup autosave\n    autocmd FocusLost * :wa\n    autocmd FocusGained,BufEnter * :checktime\n  augroup END\n  ")
local function _1_()
  local weirdSpaces = "weirdSpaces"
  vim.fn.matchadd(weirdSpaces, "\\(\\%u000B\\|\\%u000C\\|\\%u0085\\|\\%u00A0\\|\\%u1680\\|\\%u2000\\|\\%u2001\\|\\%u2002\\|\\%u2003\\|\\%u2004\\|\\%u2005\\|\\%u2006\\|\\%u2007\\|\\%u2008\\|\\%u2009\\|\\%u200A\\|\\%u2028\\|\\%u2029\\|\\%u202F\\|\\%u205F\\|\\%u3000\\)")
  return vim.api.nvim_set_hl(0, weirdSpaces, {bg = "#a6a6a6", fg = "white"})
end
return vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {group = vim.api.nvim_create_augroup("HighlightFullWidthSpace", {}), pattern = "*", callback = _1_})
