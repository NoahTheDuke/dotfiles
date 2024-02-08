(local utils (require "utils"))

;; :MinimapToggle
[(utils.dep
   "https://github.com/wfxr/minimap.vim"
   {:name "minimap.vim"
    :config
    (fn []
      (set vim.g.minimap_highlight_range 1)
      (set vim.g.minimap_width 10)
      (set vim.g.minimap_git_colors 1))})]
