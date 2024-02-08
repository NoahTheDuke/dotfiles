(local utils (require "utils"))

[(utils.dep
   "https://github.com/gpanders/editorconfig.nvim"
   {:name "editorconfig.nvim"
    :config
    (fn []
      (set vim.g.EditorConfig_exclude_patterns ["fugitive://.*"]))})]
