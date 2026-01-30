-- [nfnl] nvim/fnl/plugins/nvim-treesitter.fnl
local utils = require("utils")
local function setup_custom_langs()
  local function _1_()
    local errors_2_ = {}
    local _3_, ts_parsers
    local function _4_()
      return require("nvim-treesitter.parsers")
    end
    local function _5_(err_1_auto)
      return table.insert(errors_2_, debug.traceback(err_1_auto))
    end
    _3_, ts_parsers = xpcall(_4_, _5_)
    if _3_ then
      ts_parsers.asciidoc = {install_info = {url = "https://github.com/cathaysia/tree-sitter-asciidoc.git", branch = "master", location = "tree-sitter-asciidoc", queries = "queries"}}
      ts_parsers.asciidoc_inline = {install_info = {url = "https://github.com/cathaysia/tree-sitter-asciidoc.git", branch = "master", location = "tree-sitter-asciidoc_inline", queries = "queries"}}
      ts_parsers.talon = {install_info = {url = "https://github.com/wenkokke/tree-sitter-talon.git", files = {"src/parser.c", "src/scanner.c"}, branch = "dev"}}
      return nil
    else
      return vim.notify(errors_2_[1], vim.log.levels.ERROR)
    end
  end
  return vim.api.nvim_create_autocmd("User", {pattern = {"TSUpdate"}, callback = _1_})
end
local all_languages = {"asciidoc", "asciidoc_inline", "angular", "clojure", "cooklang", "djot", "fennel", "java", "javascript", "json", "json5", "just", "lua", "markdown", "markdown_inline", "ocaml", "ocaml_interface", "ocamllex", "python", "query", "racket", "rust", "scheme", "talon", "typescript", "vimdoc", "vue", "yaml"}
local function start_lang(language)
  local function _7_()
    return vim.treesitter.start()
  end
  return vim.api.nvim_create_autocmd("FileType", {pattern = {language}, callback = _7_})
end
local function config()
  local errors_8_ = {}
  local _9_, ts
  local function _10_()
    return require("nvim-treesitter")
  end
  local function _11_(err_1_auto)
    return table.insert(errors_8_, debug.traceback(err_1_auto))
  end
  _9_, ts = xpcall(_10_, _11_)
  if _9_ then
    setup_custom_langs()
    ts.install(all_languages)
    for _, language in ipairs(all_languages) do
      start_lang(language)
    end
    vim.treesitter.language.register("clojure", {"basilisp"})
    vim.treesitter.language.register("scheme", {"dune"})
    return nil
  else
    return vim.notify(errors_8_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/nvim-treesitter/nvim-treesitter", {config = config, branch = "main", revision = "HEAD", build = ":TSUpdate"})
