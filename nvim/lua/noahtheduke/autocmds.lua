-- [nfnl] fnl/noahtheduke/autocmds.fnl
local function set_ft(augroup, pattern, ft)
  local function _1_(_args)
    do
      vim.api.nvim_set_option_value("filetype", ft, {scope = "local"})
    end
    return nil
  end
  return vim.api.nvim_create_autocmd({"BufNewFile", "BufReadPost"}, {group = augroup, pattern = pattern, callback = _1_})
end
do
  local filetypes_augroup = vim.api.nvim_create_augroup("SetFileTypes", {clear = true})
  local function _2_(_args)
    do
      vim.api.nvim_set_option_value("spell", true, {scope = "local"})
      vim.api.nvim_set_option_value("textwidth", 80, {scope = "local"})
    end
    return nil
  end
  vim.api.nvim_create_autocmd({"Filetype"}, {group = filetypes_augroup, pattern = "gitcommit", callback = _2_})
  local function _3_(_args)
    do
      vim.api.nvim_set_option_value("spell", false, {scope = "local"})
      vim.api.nvim_set_option_value("number", false, {scope = "local"})
      vim.api.nvim_set_option_value("relativenumber", false, {scope = "local"})
    end
    return nil
  end
  vim.api.nvim_create_autocmd({"TermOpen"}, {group = filetypes_augroup, pattern = "*", callback = _3_})
  vim.api.nvim_create_autocmd({"TermOpen", "BufEnter"}, {group = filetypes_augroup, pattern = "term://*", command = "startinsert"})
  set_ft(filetypes_augroup, "*.axvw", "xml")
  set_ft(filetypes_augroup, "*.md", "markdown")
  set_ft(filetypes_augroup, "*.asd", "lisp")
  set_ft(filetypes_augroup, "*.asm", "z80")
end
do
  local autosave_augroup = vim.api.nvim_create_augroup("autosave", {clear = true})
  vim.api.nvim_create_autocmd({"FocusLost"}, {group = autosave_augroup, pattern = "*", command = ":silent! wa"})
  vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {group = autosave_augroup, pattern = "*", command = ":checktime"})
end
local function _4_(_args)
  do
    local weirdSpaces = "weirdSpaces"
    vim.fn.matchadd(weirdSpaces, "\\(\\%u000B\\|\\%u000C\\|\\%u0085\\|\\%u00A0\\|\\%u1680\\|\\%u2000\\|\\%u2001\\|\\%u2002\\|\\%u2003\\|\\%u2004\\|\\%u2005\\|\\%u2006\\|\\%u2007\\|\\%u2008\\|\\%u2009\\|\\%u200A\\|\\%u2028\\|\\%u2029\\|\\%u202F\\|\\%u205F\\|\\%u3000\\)")
    vim.api.nvim_set_hl(0, weirdSpaces, {bg = "#a6a6a6", fg = "white"})
  end
  return nil
end
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {group = vim.api.nvim_create_augroup("HighlightFullWidthSpace", {}), pattern = "*", callback = _4_})
local function _5_(_args)
  do
    vim.diagnostic.open_float({header = "", scope = "cursor"})
  end
  return nil
end
return vim.api.nvim_create_autocmd({"CursorHold"}, {pattern = "*", callback = _5_})
