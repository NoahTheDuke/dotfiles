local nvim = require "vendor.nvim"

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Resize with arrows
nvim.set_keymap("n", "<C-Up>", ":resize +2<CR>", opts)
nvim.set_keymap("n", "<C-Down>", ":resize -2<CR>", opts)
nvim.set_keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
nvim.set_keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Stay in indent mode
nvim.set_keymap("v", "<", "<gv", opts)
nvim.set_keymap("v", ">", ">gv", opts)

-- Move text up and down
nvim.set_keymap("v", "<A-j>", ":m .+1<CR>==", opts)
nvim.set_keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Move text up and down
nvim.set_keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
nvim.set_keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
nvim.set_keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
nvim.set_keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better terminal navigation
nvim.set_keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
nvim.set_keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
nvim.set_keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
nvim.set_keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- * jj  -> Escape: Classic input mode remap, for speed and no hand-movement.
-- * F1  -> Escape: Obvious, but extremely helpful when the hand misses.
-- * Q   -> nop:    I don't use Ex/Command mode, and I hit this a lot on accident. GONE.
-- * Y   -> y$:     Now matches the other capital letter commands: D, C, etc.
-- * V   -> v$:     Now matches the other capital letter commands: D, C, etc.
-- * #   -> #:      All this does is enter a single letter (X), delete the letter, and reenter the comment character.
--                  This fixes an issue with smartindent.
-- * Ctrl-a/Ctrl-x: Within a visual selection, increments or decrements the first number on each line selected.

nvim.set_keymap("i", "<F1>", "<ESC>", opts)
nvim.set_keymap("n", "<F1>", "<ESC>", opts)
nvim.set_keymap("v", "<F1>", "<ESC>", opts)
nvim.set_keymap("n", "Q", "<nop>", opts)
nvim.set_keymap("i", "jj", "<ESC>", opts)
nvim.set_keymap("n", "vv", "V", opts)
nvim.set_keymap("n", "V", "<C-V>$", opts)
nvim.set_keymap("v", "<C-a>", ":s#\\%V/-\\=\\d\\+#\\=submatch(0)+1#g", opts)
nvim.set_keymap("v", "<C-x>", ":s#\\%V/-\\=\\d\\+#\\=submatch(0)-1#g", opts)

nvim.set_keymap("n", "<F5>", ":UndotreeToggle<CR>", opts)
nvim.set_keymap("n", "<F6>", ":NvimTreeToggle %:h<CR>", opts)
nvim.set_keymap("n", "<F7>", ":MinimapToggle<CR>", opts)

nvim.set_keymap("n",
  "<F10>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>]],
  opts
)

nvim.create_user_command(
  "Notes",
  [[ call GuiNewWindow("<args>") ]],
  { nargs = 1 }
)
