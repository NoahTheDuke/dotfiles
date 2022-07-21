if vim.g["started_by_firenvim"] then
  vim.opt.laststatus = 0
  vim.opt.showtabline = 0
  vim.opt.textwidth = 0
  vim.opt.statusline = [[ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P ]]

  vim.g["airline_disable_statusline"] = 1
  vim.g["airline#extensions#tabline#enabled"] = 0
end
