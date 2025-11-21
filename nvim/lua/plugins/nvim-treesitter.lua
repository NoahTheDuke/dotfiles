-- [nfnl] nvim/fnl/plugins/nvim-treesitter.fnl
local utils = require("utils")
local function setup_custom_langs()
  local function _1_()
    local status_ok_2_auto, ts_parsers = pcall(require, "nvim-treesitter.parsers")
    if status_ok_2_auto then
      ts_parsers.asciidoc = {install_info = {url = "https://github.com/cathaysia/tree-sitter-asciidoc.git", branch = "master", location = "tree-sitter-asciidoc", queries = "queries"}}
      ts_parsers.asciidoc_inline = {install_info = {url = "https://github.com/cathaysia/tree-sitter-asciidoc.git", branch = "master", location = "tree-sitter-asciidoc_inline", queries = "queries"}}
      ts_parsers.talon = {install_info = {url = "https://github.com/wenkokke/tree-sitter-talon.git", files = {"src/parser.c", "src/scanner.c"}, branch = "dev"}}
      return nil
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("User", {pattern = {"TSUpdate"}, callback = _1_})
end
local all_languages = {"asciidoc", "asciidoc_inline", "angular", "clojure", "cooklang", "djot", "fennel", "java", "javascript", "json", "json5", "jsonc", "just", "lua", "markdown", "markdown_inline", "ocaml", "ocaml_interface", "ocamllex", "python", "query", "racket", "rust", "scheme", "talon", "typescript", "vimdoc", "vue"}
local function start_lang(language)
  local function _3_()
    return vim.treesitter.start()
  end
  return vim.api.nvim_create_autocmd("FileType", {pattern = {language}, callback = _3_})
end
local function config()
  local status_ok_2_auto, ts = pcall(require, "nvim-treesitter")
  if status_ok_2_auto then
    setup_custom_langs()
    ts.install(all_languages)
    for _, language in ipairs(all_languages) do
      start_lang(language)
    end
    vim.treesitter.language.register("clojure", {"basilisp"})
    vim.treesitter.language.register("scheme", {"dune"})
    return nil
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/nvim-treesitter/nvim-treesitter", {config = config, branch = "main", revision = "HEAD", build = ":TSUpdate"})
