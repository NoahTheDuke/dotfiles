-- [nfnl] nvim/fnl/keymaps.fnl
local opts = {noremap = true, silent = true}
local term_opts = {silent = true}
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
vim.api.nvim_set_keymap("v", "<", "<gv", opts)
vim.api.nvim_set_keymap("v", ">", ">gv", opts)
vim.api.nvim_set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
vim.api.nvim_set_keymap("i", "<F1>", "<ESC>", opts)
vim.api.nvim_set_keymap("n", "<F1>", "<ESC>", opts)
vim.api.nvim_set_keymap("v", "<F1>", "<ESC>", opts)
vim.api.nvim_set_keymap("n", "Q", "<nop>", opts)
vim.api.nvim_set_keymap("i", "jj", "<ESC>", opts)
vim.api.nvim_set_keymap("n", "vv", "V", opts)
vim.api.nvim_set_keymap("n", "V", "<C-V>$", opts)
vim.api.nvim_set_keymap("v", "<C-a>", ":s#\\%V/-\\=\\d\\+#\\=submatch(0)+1#g", opts)
vim.api.nvim_set_keymap("v", "<C-x>", ":s#\\%V/-\\=\\d\\+#\\=submatch(0)-1#g", opts)
vim.api.nvim_set_keymap("n", "<F5>", ":UndotreeToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<F7>", ":MinimapToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<F10>", string.format(":echo \"hi<%s> trans<%s> lo<%s>\"<CR>", "synIDattr(synID(line(\".\"), col(\".\"), 1), \"name\")", "synIDattr(synID(line(\".\"), col(\".\"), 0), \"name\")", "synIDattr(synIDtrans(synID(line(\".\"), col(\".\"), 1)), \"name\")"), opts)
return vim.api.nvim_create_user_command("Splint", ":exe 'cexpr system(\"splint '.expand('%').' -o clj-kondo --no-summary\")'", {nargs = 0})
