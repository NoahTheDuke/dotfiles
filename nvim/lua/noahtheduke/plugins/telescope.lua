-- [nfnl] fnl/noahtheduke/plugins/telescope.fnl
local utils = require("noahtheduke.utils")
local keyset = vim.keymap.set
local function config()
  local errors_1_ = {}
  local _2_, telescope
  local function _5_()
    return require("telescope")
  end
  local function _6_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/telescope.fnl:6", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, telescope = xpcall(_5_, _6_)
  local _3_, actions
  local function _8_()
    return require("telescope.actions")
  end
  local function _9_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/telescope.fnl:6", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _3_, actions = xpcall(_8_, _9_)
  local _4_, builtin
  local function _11_()
    return require("telescope.builtin")
  end
  local function _12_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/telescope.fnl:6", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _4_, builtin = xpcall(_11_, _12_)
  if (_2_ and _3_ and _4_) then
    telescope.load_extension("fzf")
    telescope.setup({defaults = {prompt_prefix = "\239\145\171 ", selection_caret = "\239\129\164 ", path_display = {shorten = {len = 3, exclude = {-1, -2}}}, mappings = {i = {["<C-n>"] = actions.cycle_history_next, ["<C-p>"] = actions.cycle_history_prev, ["<C-j>"] = actions.move_selection_next, ["<C-k>"] = actions.move_selection_previous, ["<C-c>"] = actions.close, ["<esc>"] = actions.close, ["<Down>"] = actions.move_selection_next, ["<Up>"] = actions.move_selection_previous, ["<CR>"] = actions.select_default, ["<C-x>"] = actions.select_horizontal, ["<C-v>"] = actions.select_vertical, ["<C-t>"] = actions.select_tab, ["<C-u>"] = actions.preview_scrolling_up, ["<C-d>"] = actions.preview_scrolling_down, ["<PageUp>"] = actions.results_scrolling_up, ["<PageDown>"] = actions.results_scrolling_down, ["<Tab>"] = (actions.toggle_selection + actions.move_selection_worse), ["<S-Tab>"] = (actions.toggle_selection + actions.move_selection_better), ["<C-q>"] = (actions.send_to_qflist + actions.open_qflist), ["<M-q>"] = (actions.send_selected_to_qflist + actions.open_qflist), ["<C-l>"] = actions.complete_tag, ["<C-_>"] = actions.which_key}, n = {["<esc>"] = actions.close, ["<CR>"] = actions.select_default, ["<C-x>"] = actions.select_horizontal, ["<C-v>"] = actions.select_vertical, ["<C-t>"] = actions.select_tab, ["<Tab>"] = (actions.toggle_selection + actions.move_selection_worse), ["<S-Tab>"] = (actions.toggle_selection + actions.move_selection_better), ["<C-q>"] = (actions.send_to_qflist + actions.open_qflist), ["<M-q>"] = (actions.send_selected_to_qflist + actions.open_qflist), j = actions.move_selection_next, k = actions.move_selection_previous, H = actions.move_to_top, M = actions.move_to_middle, L = actions.move_to_bottom, ["<Down>"] = actions.move_selection_next, ["<Up>"] = actions.move_selection_previous, gg = actions.move_to_top, G = actions.move_to_bottom, ["<C-u>"] = actions.preview_scrolling_up, ["<C-d>"] = actions.preview_scrolling_down, ["<PageUp>"] = actions.results_scrolling_up, ["<PageDown>"] = actions.results_scrolling_down, ["?"] = actions.which_key}}}, pickers = {find_files = {find_command = {"fd", "--type", "f"}}}})
    keyset("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", {noremap = true, silent = true, desc = "Telescope find files"})
    keyset("n", "<leader>ft", ":lua require('telescope.builtin').live_grep()<cr>", {noremap = true, silent = true, desc = "Telescope grep"})
    keyset("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", {noremap = true, silent = true, desc = "Telescope buffers"})
    keyset("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>", {noremap = true, silent = true, desc = "Telescope help tags"})
    keyset("n", "<leader>fcs", ":lua require('telescope.builtin').colorscheme()<cr>", {noremap = true, silent = true, desc = "Choose colorscheme"})
    keyset("n", "<leader>:", ":lua require('telescope.builtin').commands()<cr>", {noremap = true, silent = true, desc = "Telescope : commands"})
    local lsp_list = {{lhs = "<leader>te", rhs = builtin.diagnostics, desc = "List diagnostics"}, {lhs = "<leader>ti", rhs = builtin.lsp_implementations, desc = "Goto the implementation of the word under the cursor if there's only one, otherwise show all options"}, {lhs = "<leader>tr", rhs = builtin.lsp_references, desc = "Lists LSP references for word under the cursor"}, {lhs = "<leader>ts", rhs = builtin.lsp_document_symbols, desc = "Lists LSP document symbols in the current buffer"}}
    for _, v in ipairs(lsp_list) do
      keyset("n", v.lhs, v.rhs, {nowait = true, noremap = true, silent = true, desc = v.desc})
    end
    return nil
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/nvim-telescope/telescope.nvim", {dependencies = {{"https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = "make"}}, config = config})
