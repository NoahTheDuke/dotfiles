local options = {
  autochdir = true,
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  colorcolumn = "88",
  completeopt = table.concat({ "menuone", "noselect" }, ","),
  conceallevel = 0,
  expandtab = true,
  foldenable = false,
  formatoptions = "tqrn1j",
  guioptions = "grtC",
  list = true,
  listchars = "tab:> ,eol:¬,trail:~,nbsp:+",
  modelines = 0,
  mouse = "a",
  number = true,
  pumheight = 10,
  scrolloff = 2,
  shiftwidth = 4,
  shortmess = "filnxtToOFAc",
  showmatch = true,
  showmode = false,
  showtabline = 0,
  signcolumn = "yes",
  softtabstop = -1,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 4,
  termguicolors = true,
  textwidth = 88,
  title = true,
  undofile = true,
  updatetime = 300,
  visualbell = true,
  whichwrap = "<,>,[,],b,s,h,l",
  wildignore = "*\\tmp\\*,*\\target\\*,*\\out\\*",
  wildignorecase = true,
}

vim.cmd("set iskeyword+=-")

for k, v in pairs(options) do
  pcall(vim.api.nvim_set_option, k, v)
end

-- idk how to do g:vars yet
-- let g:netrw_banner = 0
-- let g:netrw_liststyle = 3
-- let g:netrw_browse_split = 4
-- let g:netrw_altv = 1
-- let g:netrw_winsize = 10
