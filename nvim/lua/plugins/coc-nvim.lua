-- [nfnl] nvim/fnl/plugins/coc-nvim.fnl
local utils = require("utils")
local opts = {noremap = true, silent = true}
local scroll_opts = {silent = true, nowait = true, expr = true}
local keyset = vim.keymap.set
local function coc_command(name, ...)
  local vargs = {...}
  vargs.n = select("#", ...)
  local function _1_()
    return vim.fn.CocActionAsync(unpack(vargs))
  end
  return vim.api.nvim_create_user_command(name, _1_, {nargs = 0})
end
local function config()
  vim.g.coc_default_semantic_highlight_groups = 1
  vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {group = vim.api.nvim_create_augroup("CocConfigSyntax", {}), pattern = {"coc-settings.json"}, command = "set filetype=jsonc"})
  vim.api.nvim_set_keymap("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm() : \"<CR>\"", scroll_opts)
  keyset("n", "[g", "<Plug>(coc-diagnostic-prev)")
  keyset("n", "]g", "<Plug>(coc-diagnostic-next)")
  keyset("n", "<leader>rn", "<Plug>(coc-rename)")
  keyset("n", "<leader>rf", "<Plug>(coc-refactor)")
  keyset("v", "<leader>f", "<Plug>(coc-format-selected)")
  keyset("v", "<leader>a", "<Plug>(coc-codeaction-selected)")
  keyset("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)")
  keyset("n", "<leader>af", "<Plug>(coc-codeaction)")
  keyset("n", "<leader>qf", "<Plug>(coc-fix-current)")
  keyset("n", "<leader>cla", "<Plug>(coc-codelens-action)")
  keyset("n", "gd", "<Plug>(coc-definition)", opts)
  keyset("n", "<leader>gi", "<Plug>(coc-implementation)", opts)
  keyset("n", "<leader>gr", "<Plug>(coc-references)", opts)
  keyset("n", "<leader>gy", "<Plug>(coc-type-definition)", opts)
  keyset({x = "o"}, "if", "<Plug>(coc-funcobj-i)")
  keyset({x = "o"}, "af", "<Plug>(coc-funcobj-a)")
  keyset({x = "o"}, "ic", "<Plug>(coc-classobj-i)")
  keyset({x = "o"}, "ac", "<Plug>(coc-classobj-a)")
  keyset({n = "v"}, "<C-f>", "coc#float#has_scroll() ? coc#float#scroll(1) : \"<C-f>\"", scroll_opts)
  keyset({n = "v"}, "<C-b>", "coc#float#has_scroll() ? coc#float#scroll(0) : \"<C-b>\"", scroll_opts)
  keyset("i", "<C-f>", "coc#float#has_scroll() ? \"<c-r>=coc#float#scroll(1)<cr>\" : \"<Right>\"", scroll_opts)
  keyset("i", "<C-b>", "coc#float#has_scroll() ? \"<c-r>=coc#float#scroll(0)<cr>\" : \"<Left>\"", scroll_opts)
  keyset({n = "x"}, "<C-s>", "<Plug>(coc-range-select)", opts)
  coc_command("Format", "format")
  coc_command("OR", "runCommand", "editor.action.organizeImport")
  _G.Coc_show_documentation = function()
    local filetype = vim.bo.filetype
    if ((filetype == "vim") or (filetype == "help")) then
      vim.api.nvim_command(("h " .. filetype))
    elseif (vim.cmd("coc#rpc#ready") and vim.fn.CocAction("hasProvider", "hover")) then
      vim.fn.CocActionAsync("doHover")
    else
    end
    return nil
  end
  _G.show_docs = function()
    local cw = vim.fn.expand("<cword>")
    if (0 <= vim.fn.index({"vim", "help"}, vim.bo.filetype)) then
      vim.api.nvim_command(("h " .. cw))
    elseif vim.api.nvim_eval("coc#rpc#ready()") then
      vim.fn.CocActionAsync("doHover")
    else
      vim.api.nvim_command(("!" .. vim.o.keywordprg .. " " .. cw))
    end
    return nil
  end
  return keyset("n", "K", _G.show_docs, opts)
end
return {}
