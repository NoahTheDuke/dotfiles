-- [nfnl] nvim/fnl/plugins/nvim-treesitter.fnl
local utils = require("utils")
local function config()
  local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
  if status_ok then
    ts_config.setup({ensure_installed = {"angular", "clojure", "djot", "fennel", "javascript", "lua", "markdown", "markdown_inline", "ocaml", "query", "rust", "typescript", "vimdoc", "vue"}, highlight = {enable = true}, incremental_selection = {enable = true}, textobjects = {enable = true}, playground = {enable = true}})
    local parsers = require("nvim-treesitter.parsers")
    local parser_config = parsers:get_parser_configs()
    parser_config.asciidoc = {install_info = {url = "https://github.com/cathaysia/tree-sitter-asciidoc.git", files = {"tree-sitter-asciidoc/src/parser.c", "tree-sitter-asciidoc/src/scanner.c"}, branch = "master", generate_requires_npm = false, requires_generate_from_grammar = false}}
    parser_config.asciidoc_inline = {install_info = {url = "https://github.com/cathaysia/tree-sitter-asciidoc.git", files = {"tree-sitter-asciidoc_inline/src/parser.c", "tree-sitter-asciidoc_inline/src/scanner.c"}, branch = "master", generate_requires_npm = false, requires_generate_from_grammar = false}}
    parser_config.talon = {install_info = {url = "https://github.com/wenkokke/tree-sitter-talon.git", files = {"src/parser.c", "src/scanner.c"}, branch = "dev", generate_requires_npm = false, requires_generate_from_grammar = false}}
    return vim.treesitter.language.register("clojure", "basilisp")
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/nvim-treesitter/nvim-treesitter", {config = config, build = ":TSUpdate"})
