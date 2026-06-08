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
vim.api.nvim_set_keymap("n", "<F5>", ":Undotree<CR>", opts)
vim.api.nvim_set_keymap("n", "<F6>", ":NvimTreeFindFileToggle<CR>", opts)
vim.api.nvim_set_keymap("n", "<F7>", ":MinimapToggle<CR>", opts)
vim.api.nvim_create_user_command("Splint", ":exe 'cexpr system(\"splint '.expand('%').' -o clj-kondo --no-summary\")'", {nargs = 0})
local function _1_()
  return vim.lsp.buf.hover({border = "rounded"})
end
vim.keymap.set("n", "K", _1_, utils["ks-opts"]("show docs"))
local function go_to_definition()
  local _2_
  if next(vim.lsp.get_clients({bufnr = 0})) then
    vim.lsp.buf.definition()
    _2_ = true
  else
    _2_ = nil
  end
  local or_4_ = _2_
  if not or_4_ then
    local errors_5_ = {}
    local _6_, eval
    local function _8_()
      return require("conjure.eval")
    end
    local function _9_(err_2_auto)
      if (nil == err_2_auto) then
        _G.error("Missing argument err_2_auto on fnl/noahtheduke/keymaps.fnl:76", 2)
      else
      end
      return table.insert(errors_5_, debug.traceback(err_2_auto))
    end
    _6_, eval = xpcall(_8_, _9_)
    if _6_ then
      local bind_7_auto = eval["def-word"]()
      if (bind_7_auto ~= nil) then
        local ret = bind_7_auto
        or_4_ = ("definition not found" ~= ret.result)
      else
        or_4_ = nil
      end
    elseif next(errors_5_) then
      or_4_ = vim.notify(errors_5_[1], vim.log.levels.ERROR)
    else
      or_4_ = nil
    end
  end
  if not or_4_ then
    if (0 <= vim.fn.index({"vim", "help"}, vim.bo.filetype)) then
      vim.api.nvim_command(("h " .. vim.fn.expand("<cword>")))
      or_4_ = true
    else
      or_4_ = nil
    end
  end
  do local _ = (or_4_ or vim.api.nvim_command(("!" .. vim.o.keywordprg .. " " .. vim.fn.expand("<cword>")))) end
  return nil
end
return vim.keymap.set("n", "gd", go_to_definition, utils["ks-opts"]("go to definition"))
