-- [nfnl] fnl/noahtheduke/plugins/nvim-treesitter.fnl
local utils = require("noahtheduke.utils")
local function setup_custom_langs()
  local function _1_()
    local errors_2_ = {}
    local _3_, ts_parsers
    local function _4_()
      return require("nvim-treesitter.parsers")
    end
    local function _5_(err_2_auto)
      if (nil == err_2_auto) then
        _G.error("Missing argument err_2_auto on /Users/noah/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-treesitter.fnl:10", 2)
      else
      end
      return table.insert(errors_2_, debug.traceback(err_2_auto))
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
  if (nil == language) then
    _G.error("Missing argument language on /Users/noah/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-treesitter.fnl:60", 2)
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
      _G.error("Missing argument err_2_auto on /Users/noah/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-treesitter.fnl:67", 2)
    else
    end
    return table.insert(errors_10_, debug.traceback(err_2_auto))
  end
  _11_, ts = xpcall(_12_, _13_)
  if _11_ then
    setup_custom_langs()
    ts.install(all_languages)
    for _, language in ipairs(all_languages) do
      start_lang(language)
    end
    vim.treesitter.language.register("clojure", {"basilisp"})
    vim.treesitter.language.register("scheme", {"dune"})
    return nil
  else
    return vim.notify(errors_10_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
local function mod_config()
  local errors_16_ = {}
  local _17_, mods
  local function _18_()
    return require("treesitter-modules")
  end
  local function _19_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-treesitter.fnl:80", 2)
    else
    end
    return table.insert(errors_16_, debug.traceback(err_2_auto))
  end
  _17_, mods = xpcall(_18_, _19_)
  if _17_ then
    return mods.setup({incremental_selection = {enable = true}})
  else
    return vim.notify(errors_16_[1], vim.log.levels.ERROR)
  end
end
return {utils.dep("https://github.com/nvim-treesitter/nvim-treesitter", {config = config, branch = "main", revision = "HEAD", build = ":TSUpdate"}), utils.dep("https://github.com/MeanderingProgrammer/treesitter-modules.nvim", {dependencies = {"nvim-treesitter/nvim-treesitter"}, config = mod_config})}
