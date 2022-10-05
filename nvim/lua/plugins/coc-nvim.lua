-- settings
vim.g.coc_default_semantic_highlight_groups = 1

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  group = vim.api.nvim_create_augroup("CocConfigSyntax", {}),
  pattern = { "coc-settings.json" },
  command = "setfiletype jsonc",
})

-- Auto-select the first completion item and notify coc.nvim to format on enter
vim.keymap.set("i", "<cr>", function()
  if vim.fn["coc#pum#visible"]() then
    return vim.fn["coc#_select_confirm"]()
  else
    return vim.api.nvim_feedkeys("<C-g>u<CR><c-r>=coc#on_enter()<CR>", "n", true)
  end
end, {
  noremap = true,
  silent = true,
})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.keymap.set("n", "<silent>", "[g <Plug>(coc-diagnostic-prev)")
vim.keymap.set("n", "<silent>", "]g <Plug>(coc-diagnostic-next)")

-- GoTo code navigation.
vim.keymap.set("n", "<silent>", "<leader>gy <Plug>(coc-type-definition)")
vim.keymap.set("n", "<silent>", "<leader>gi <Plug>(coc-implementation)")
vim.keymap.set("n", "<silent>", "<leader>gr <Plug>(coc-references)")

vim.api.nvim_create_autocmd("CursorHold", {
  group = vim.api.nvim_create_augroup("CocHighlight", {}),
  pattern = {"*"},
  callback = function()
    vim.fn.CocActionAsync("highlight")
  end,
  desc = "Highlight the symbol and its references when holding the cursor",
})


vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)")
vim.keymap.set("n", "<leader>rf", "<Plug>(coc-refactor)")
vim.keymap.set("v", "<leader>f", "<Plug>(coc-format-selected)")
vim.keymap.set("v", "<leader>a", "<Plug>(coc-codeaction-selected)")
vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)")
vim.keymap.set("n", "<leader>af", "<Plug>(coc-codeaction)")
vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)")
vim.keymap.set("n", "<leader>cla", "<Plug>(coc-codelens-action)")

-- Map function and class text objects
vim.keymap.set({ "x", "o" }, "if", "<Plug>(coc-funcobj-i)")
vim.keymap.set({ "x", "o" }, "af", "<Plug>(coc-funcobj-a)")
vim.keymap.set({ "x", "o" }, "ic", "<Plug>(coc-classobj-i)")
vim.keymap.set({ "x", "o" }, "ac", "<Plug>(coc-classobj-a)")

-- Remap <C-f> and <C-b> for scroll float windows/popups.
local function float_scroll(mode, key, dir, alt)
  vim.keymap.set(mode, key, function()
    if vim.fn["coc#float#has_float()"]() then
      return vim.fn["coc#float#scroll(" .. dir .. ")"]()
    else
      return vim.api.nvim_feedkeys(alt, mode, true)
    end
  end, {
    nowait = true,
    noremap = true,
    silent = true,
  })
end

float_scroll({ "n", "v" }, "<C-f>", 1, "<C-f>")
float_scroll({ "n", "v" }, "<C-b>", 0, "<C-b>")
float_scroll("i", "<C-f>", 1, "<C-f>")
float_scroll("i", "<C-b>", 0, "<C-b>")

local opts = { noremap = true, silent = true }

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
vim.keymap.set({ "n", "x" }, "<C-s>", "<Plug>(coc-range-select)", opts)

local function coc_command(name, ...)
  vim.api.nvim_create_user_command(name, function()
    vim.fn.CocActionAsync(unpack(arg))
  end, { nargs = 0 })
end

coc_command("Format", "format")
coc_command("OR", "runCommand", "editor.action.organizeImport")
coc_command("Open", "openLink")

-- Mappings for CoCList
local coc_list = {
  { lhs = "<space>a", rhs = "<cmd>CocList diagnostics<cr>" },
  { lhs = "<space>e", rhs = "<cmd>CocList extensions<cr>" },
  { lhs = "<space>c", rhs = "<cmd>CocList commands<cr>" },
  { lhs = "<space>o", rhs = "<cmd>CocList outline<cr>" },
  { lhs = "<space>s", rhs = "<cmd>CocList -I symbols<cr>" },
  { lhs = "<space>j", rhs = "<cmd>CocNext<CR>" },
  { lhs = "<space>k", rhs = "<cmd>CocPrev<CR>" },
  { lhs = "<space>p", rhs = "<cmd>CocListResume<CR>" },
}
for _, v in ipairs(coc_list) do
  vim.api.nvim_set_keymap("n", v.lhs, v.rhs, {
    nowait = true,
    noremap = true,
    silent = true,
  })
end


local function go_to_definition()
  if vim.call("coc#rpc#ready") and vim.fn.CocAction("hasProvider", "definition") then
    vim.fn.CocActionAsync("jumpDefinition")
  end
end

vim.keymap.set("n", "gd", go_to_definition, opts)

function Coc_show_documentation()
  local filetype = vim.bo.filetype

  if filetype == "vim" or filetype == "help" then
    vim.api.nvim_command("h " .. filetype)
  elseif vim.call("coc#rpc#ready") and vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync("doHover")
  end
end

vim.keymap.set('n', 'K', Coc_show_documentation, opts)
