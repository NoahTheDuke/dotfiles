-- [nfnl] fnl/noahtheduke/plugins/nvim-treesitter.fnl
local utils = require("noahtheduke.utils")
local custom_langs
local function _1_()
  do
  end
  return nil
end
custom_langs = _1_
local function setup_custom_langs()
  return vim.api.nvim_create_autocmd("User", {pattern = {"TSUpdate"}, callback = custom_langs})
end
local all_languages = {"angular", "clojure", "cooklang", "djot", "fennel", "java", "javascript", "json", "json5", "just", "lua", "markdown", "markdown_inline", "ocaml", "ocaml_interface", "ocamllex", "python", "query", "racket", "rust", "scheme", "svelte", "typescript", "vimdoc", "vue", "xml", "yaml"}
local function start_lang(language)
  if (nil == language) then
    _G.error("Missing argument language on fnl/noahtheduke/plugins/nvim-treesitter.fnl:63", 2)
  else
  end
  local function _3_()
    return vim.treesitter.start()
  end
  return vim.api.nvim_create_autocmd("FileType", {pattern = {language}, callback = _3_})
end
local function config()
  local errors_4_ = {}
  local _5_, ts
  local function _6_()
    return require("nvim-treesitter")
  end
  local function _7_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/nvim-treesitter.fnl:70", 2)
    else
    end
    return table.insert(errors_4_, debug.traceback(err_2_auto))
  end
  _5_, ts = xpcall(_6_, _7_)
  if _5_ then
    setup_custom_langs()
    ts.install(all_languages)
    for _, language in ipairs(all_languages) do
      start_lang(language)
    end
    vim.treesitter.language.register("clojure", {"basilisp"})
    vim.treesitter.language.register("scheme", {"dune"})
    return nil
  elseif next(errors_4_) then
    return vim.notify(errors_4_[1], vim.log.levels.ERROR)
  else
    return nil
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/nvim-treesitter/nvim-treesitter", {config = config, branch = "main", revision = "HEAD", build = ":TSUpdate"}), utils.dep("https://github.com/nvim-treesitter/nvim-treesitter-context")}
