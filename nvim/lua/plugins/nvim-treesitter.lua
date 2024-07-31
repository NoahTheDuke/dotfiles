-- [nfnl] Compiled from fnl/plugins/nvim-treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function config()
  local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return nil
  else
    ts_config.setup({ensure_installed = {"clojure", "djot", "fennel", "javascript", "lua", "markdown", "markdown_inline", "ocaml", "query", "rust", "typescript", "vimdoc", "vue"}, highlight = {enable = true}, incremental_selection = {enable = true}, textobjects = {enable = true}, playground = {enable = true}})
    return vim.treesitter.language.register("clojure", "basilisp")
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/nvim-treesitter/nvim-treesitter", {config = config})
