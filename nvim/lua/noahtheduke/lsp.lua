-- [nfnl] fnl/noahtheduke/lsp.fnl
local utils = require("noahtheduke.utils")
for _, name in ipairs({"Format", "FOrmat"}) do
  local function _1_()
    return vim.lsp.buf.format()
  end
  vim.api.nvim_create_user_command(name, _1_, {nargs = 0})
end
local function _2_()
  return vim.lsp.buf.code_action({context = {only = {"source.organizeImports"}}, apply = true})
end
vim.api.nvim_create_user_command("OR", _2_, {nargs = 0})
vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\129\151", [vim.diagnostic.severity.WARN] = "\239\129\177", [vim.diagnostic.severity.INFO] = "\239\129\154", [vim.diagnostic.severity.HINT] = "\239\129\153"}}})
local function _3_()
  return vim.lsp.buf.hover({border = "rounded"})
end
vim.keymap.set("n", "K", _3_, utils["ks-opts"]("show docs"))
local function _4_()
  return vim.lsp.buf.signature_help({border = "rounded"})
end
vim.keymap.set("i", "<C-o>", _4_, utils["ks-opts"]("show signature help"))
local function show_docs()
  do
    local cw = vim.fn.expand("<cword>")
    if (0 <= vim.fn.index({"vim", "help"}, vim.bo.filetype)) then
      vim.api.nvim_command(("h " .. cw))
    elseif (0 < #vim.lsp.get_clients({bufnr = 0})) then
      vim.lsp.buf.definition()
    else
      vim.api.nvim_command(("!" .. vim.o.keywordprg .. " " .. cw))
    end
  end
  return nil
end
vim.keymap.set("n", "gd", show_docs, utils["ks-opts"]("go to definition"))
local function _6_(args)
  if (nil == args) then
    _G.error("Missing argument args on fnl/noahtheduke/lsp.fnl:46", 2)
  else
  end
  do
    local client_id = args.data.client_id
    if not client_id then
      return
    else
    end
    local client = vim.lsp.get_client_by_id(client_id)
    if client then
      vim.lsp.semantic_tokens.enable(false, {bufnr = args.buf})
      vim.lsp.document_color.enable(false, {bufnr = args.buf})
      vim.lsp.inlay_hint.enable(true, {bufnr = args.buf})
      vim.lsp.completion.enable(true, client_id, args.buf, {autotrigger = true})
    else
    end
  end
  return nil
end
vim.api.nvim_create_autocmd({"LspAttach"}, {group = vim.api.nvim_create_augroup("lsp-completion", {clear = true}), callback = _6_})
local function _10_(_args)
  do
    vim.diagnostic.open_float({header = "", scope = "cursor", focus = false})
  end
  return nil
end
vim.api.nvim_create_autocmd({"CursorHold"}, {group = vim.api.nvim_create_augroup("lsp-cursor-hold", {clear = true}), pattern = "*", callback = _10_})
require("noahtheduke.lsp.clojure")
return nil
