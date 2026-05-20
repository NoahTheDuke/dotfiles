-- [nfnl] fnl/noahtheduke/keymaps.fnl
local utils = require("noahtheduke.utils")
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
vim.api.nvim_create_user_command("Splint", ":exe 'cexpr system(\"splint '.expand('%').' -o clj-kondo --no-summary\")'", {nargs = 0})
local function show_docs()
  return vim.lsp.buf.hover({border = "rounded"})
end
vim.keymap.set("n", "K", show_docs, utils["ks-opts"]("show docs"))
local function go_to_definition()
  local _1_
  if next(vim.lsp.get_clients({bufnr = 0})) then
    vim.lsp.buf.definition()
    _1_ = true
  else
    _1_ = nil
  end
  local or_3_ = _1_
  if not or_3_ then
    local bind_7_auto
    do
      local errors_5_ = {}
      local _6_, eval
      local function _7_()
        return require("conjure.eval")
      end
      local function _8_(err_2_auto)
        if (nil == err_2_auto) then
          _G.error("Missing argument err_2_auto on fnl/noahtheduke/keymaps.fnl:90", 2)
        else
        end
        return table.insert(errors_5_, debug.traceback(err_2_auto))
      end
      _6_, eval = xpcall(_7_, _8_)
      if _6_ then
        bind_7_auto = eval["def-word"]()
      else
        bind_7_auto = vim.notify(errors_5_[1], vim.log.levels.ERROR)
      end
    end
    if (bind_7_auto ~= nil) then
      local ret = bind_7_auto
      or_3_ = ("definition not found" ~= ret.result)
    else
      or_3_ = nil
    end
  end
  if not or_3_ then
    if (0 <= vim.fn.index({"vim", "help"}, vim.bo.filetype)) then
      vim.api.nvim_command(("h " .. vim.fn.expand("<cword>")))
      or_3_ = true
    else
      or_3_ = nil
    end
  end
  do local _ = (or_3_ or vim.api.nvim_command(("!" .. vim.o.keywordprg .. " " .. vim.fn.expand("<cword>")))) end
  return nil
end
return vim.keymap.set("n", "gd", go_to_definition, utils["ks-opts"]("go to definition"))
