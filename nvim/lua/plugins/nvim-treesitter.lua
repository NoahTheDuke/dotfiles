-- [nfnl] Compiled from fnl/plugins/nvim-treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
  if not status_ok then
    return nil
  else
    return ts_config.setup({ensure_installed = {"clojure", "fennel", "javascript", "lua", "markdown", "markdown_inline", "ocaml", "query", "rust", "typescript", "vimdoc", "vue"}, highlight = {enable = true}, incremental_selection = {enable = true}, textobjects = {enable = true}, playground = {enable = true}})
  end
end
return utils.dep("https://github.com/nvim-treesitter/nvim-treesitter", {name = "nvim-treesitter", config = _1_})
