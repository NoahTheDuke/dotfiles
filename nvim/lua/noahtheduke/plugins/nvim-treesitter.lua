-- [nfnl] fnl/noahtheduke/plugins/nvim-treesitter.fnl
local utils = require("noahtheduke.utils")
local custom_langs = {asciidoc = {install_info = {url = "https://github.com/cathaysia/tree-sitter-asciidoc.git", branch = "master", location = "tree-sitter-asciidoc", queries = "tree-sitter-asciidoc/queries"}}, asciidoc_inline = {install_info = {url = "https://github.com/cathaysia/tree-sitter-asciidoc.git", branch = "master", location = "tree-sitter-asciidoc_inline", queries = "tree-sitter-asciidoc_inline/queries"}}, talon = {install_info = {url = "https://github.com/wenkokke/tree-sitter-talon.git", files = {"src/parser.c", "src/scanner.c"}, branch = "dev"}}}
local function setup_custom_langs()
  local function _1_()
    do
      local errors_2_ = {}
      local _3_, ts_parsers
      local function _4_()
        return require("nvim-treesitter.parsers")
      end
      local function _5_(err_2_auto)
        if (nil == err_2_auto) then
          _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/nvim-treesitter.fnl:32", 2)
        else
        end
        return table.insert(errors_2_, debug.traceback(err_2_auto))
      end
      _3_, ts_parsers = xpcall(_4_, _5_)
      if _3_ then
        for lang, cfg in pairs(custom_langs) do
          ts_parsers[lang] = cfg
        end
      elseif next(errors_2_) then
        vim.notify(errors_2_[1], vim.log.levels.ERROR)
      else
      end
    end
    return nil
  end
  return vim.api.nvim_create_autocmd("User", {pattern = {"TSUpdate"}, callback = _1_})
end
local all_languages = {"angular", "clojure", "cooklang", "djot", "fennel", "java", "javascript", "json", "json5", "just", "lua", "make", "markdown", "markdown_inline", "ocaml", "ocaml_interface", "ocamllex", "python", "query", "racket", "rust", "scheme", "sql", "svelte", "terraform", "typescript", "vimdoc", "vue", "xml", "yaml"}
local function start_lang(language)
  if (nil == language) then
    _G.error("Missing argument language on fnl/noahtheduke/plugins/nvim-treesitter.fnl:68", 2)
  else
  end
  local function _9_()
    return vim.treesitter.start()
  end
  return vim.api.nvim_create_autocmd("FileType", {pattern = {language}, callback = _9_})
end
local function config()
  local errors_10_ = {}
  local _11_, ts
  local function _12_()
    return require("nvim-treesitter")
  end
  local function _13_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/nvim-treesitter.fnl:75", 2)
    else
    end
    return table.insert(errors_10_, debug.traceback(err_2_auto))
  end
  _11_, ts = xpcall(_12_, _13_)
  if _11_ then
    setup_custom_langs()
    for k, _ in pairs(custom_langs) do
      table.insert(all_languages, k)
    end
    ts.install(all_languages)
    for _, language in ipairs(all_languages) do
      start_lang(language)
    end
    vim.treesitter.language.register("clojure", {"basilisp"})
    vim.treesitter.language.register("scheme", {"dune"})
    return nil
  elseif next(errors_10_) then
    return vim.notify(errors_10_[1], vim.log.levels.ERROR)
  else
    return nil
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/nvim-treesitter/nvim-treesitter", {config = config, branch = "main", revision = "HEAD", build = ":TSUpdate"}), utils.dep("https://github.com/nvim-treesitter/nvim-treesitter-context")}
