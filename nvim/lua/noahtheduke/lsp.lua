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
  return vim.lsp.buf.signature_help({border = "rounded"})
end
vim.keymap.set("i", "<C-o>", _3_, utils["ks-opts"]("show signature help"))
local function _4_(args)
  if (nil == args) then
    _G.error("Missing argument args on fnl/noahtheduke/lsp.fnl:28", 2)
  else
  end
  do
    local bind_7_auto = args.data.client_id
    if (bind_7_auto ~= nil) then
      local client_id = bind_7_auto
      if vim.lsp.get_client_by_id(client_id) then
        vim.lsp.semantic_tokens.enable(false, {bufnr = args.buf})
        vim.lsp.document_color.enable(false, {bufnr = args.buf})
        vim.lsp.inlay_hint.enable(true, {bufnr = args.buf})
        vim.lsp.completion.enable(true, client_id, args.buf, {autotrigger = true})
      else
      end
    else
    end
  end
  return nil
end
vim.api.nvim_create_autocmd({"LspAttach"}, {group = vim.api.nvim_create_augroup("lsp-completion", {clear = true}), callback = _4_})
local function _8_(_args)
  do
    vim.diagnostic.open_float({header = "", scope = "cursor", focus = false})
  end
  return nil
end
vim.api.nvim_create_autocmd({"CursorHold"}, {group = vim.api.nvim_create_augroup("lsp-cursor-hold", {clear = true}), pattern = "*", callback = _8_})
require("noahtheduke.lsp.clojure")
return nil
