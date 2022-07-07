local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- * jj  -> Escape: Classic input mode remap, for speed and no hand-movement.
-- * F1  -> Escape: Obvious, but extremely helpful when the hand misses.
-- * Q   -> nop:    I don't use Ex/Command mode, and I hit this a lot on accident. GONE.
-- * Y   -> y$:     Now matches the other capital letter commands: D, C, etc.
-- * V   -> v$:     Now matches the other capital letter commands: D, C, etc.
-- * #   -> #:      All this does is enter a single letter (X), delete the letter, and reenter the comment character.
--                  This fixes an issue with smartindent.
-- * Ctrl-a/Ctrl-x: Within a visual selection, increments or decrements the first number on each line selected.

keymap("i", "<F1>", "<ESC>", opts)
keymap("n", "<F1>", "<ESC>", opts)
keymap("v", "<F1>", "<ESC>", opts)
keymap("n", "Q", "<nop>", opts)
keymap("i", "jj", "<ESC>", opts)
keymap("n", "vv", "V", opts)
keymap("n", "V", "<C-V>$", opts)
keymap("v", "<C-a>", ":s#\\%V/-\\=\\d\\+#\\=submatch(0)+1#g", opts)
keymap("v", "<C-x>", ":s#\\%V/-\\=\\d\\+#\\=submatch(0)-1#g", opts)

keymap("n", "<F5>", ":UndotreeToggle<CR>", opts)
keymap("n", "<F6>", ":Fern . -drawer -toggle<CR>", opts)
keymap("n", "<F7>", ":MinimapToggle<CR>", opts)

keymap("n", "<F10>", [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>]], opts)

keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)
