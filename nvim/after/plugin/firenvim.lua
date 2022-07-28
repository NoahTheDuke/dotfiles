if vim.g["started_by_firenvim"] then
  vim.opt.laststatus = 2
  vim.opt.linebreak = true
  vim.opt.showtabline = 0
  vim.opt.signcolumn = "no"
  vim.opt.textwidth = 0
  vim.opt.statusline = [[\\\ %{mode()}\ ]]
  vim.opt.statusline:append([[\ [%H%M%R%W]\]]) -- flags and buf no
  vim.opt.statusline:append([[%=]])              -- switch to right side
  vim.opt.statusline:append([[%y\]])             -- file type
  vim.opt.statusline:append([[[%l,%c]\ %p%%\]])  -- line, column and percentage

  vim.opt.guifont = "FiraCode_Nerd_Font:h12"

  vim.g["airline_disable_statusline"] = 1
  vim.g["airline#extensions#tabline#enabled"] = 0
end
