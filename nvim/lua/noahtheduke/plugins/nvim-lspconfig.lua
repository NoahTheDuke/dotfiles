-- [nfnl] fnl/noahtheduke/plugins/nvim-lspconfig.fnl
local utils = require("noahtheduke.utils")
local lsp_configs = {"fennel_ls", "lua_ls", "ocamllsp", "racket_langserver", "rust_analyzer", "terraformls", "ts_ls"}
local function config()
  for _, language in ipairs(lsp_configs) do
    vim.lsp.enable(language)
  end
  return nil
end
--[[ (config) ]]
return {utils.dep("https://github.com/neovim/nvim-lspconfig", {config = config})}
