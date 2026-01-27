-- [nfnl] nvim/fnl/plugins/nvim-lspconfig.fnl
local utils = require("utils")
local function clojure_lsp()
  vim.lsp.config("clojure-lsp", {cmd = {"clojure-lsp"}, filetypes = {"clojure"}, root_markers = {"project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", "bb.edn", ".git"}})
  return vim.lsp.enable("clojure-lsp")
end
--[[ (clojure-lsp) ]]
local lsp_configs = {"fennel_ls", "lua_ls", "ocamllsp", "racket_langserver", "rust_analyzer", "terraformls", "ts_ls"}
local function config()
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
  clojure_lsp()
  for _, language in ipairs(lsp_configs) do
    vim.lsp.enable(language)
  end
  return nil
end
return {utils.dep("https://github.com/neovim/nvim-lspconfig", {config = config})}
