-- [nfnl] nvim/fnl/plugins/nvim-treesitter.fnl
local utils = require("utils")
local languages = {"angular", "clojure", "djot", "fennel", "javascript", "lua", "markdown", "markdown_inline", "ocaml", "query", "rust", "scheme", "typescript", "vimdoc", "vue"}
local function config()
  local status_ok_2_auto, ts = pcall(require, "nvim-treesitter")
  if status_ok_2_auto then
    ts.install(languages)
    for _, language in ipairs(languages) do
      local function _1_()
        return vim.treesitter.start()
      end
      vim.api.nvim_create_autocmd("FileType", {pattern = {language}, callback = _1_})
    end
    return nil
  else
    return nil
  end
end
--[[ (config) ]]
return utils.dep("https://github.com/nvim-treesitter/nvim-treesitter", {config = config, branch = "main", build = ":TSUpdate"})
