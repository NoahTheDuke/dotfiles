(import-macros {: when-require} "noahtheduke.util-macros")

(when-require [alpha "noahtheduke.plugins.alpha"]
  (alpha.config nil nil true))

(vim.cmd.colorscheme "dracula")

; (set vim.o.background "light")
; (vim.cmd.colorscheme "gruvbox")
; (vim.cmd.colorscheme "kanagawa-lotus")
; (vim.cmd.colorscheme "tokyonight")
; (vim.cmd.colorscheme "onedark")
; (vim.cmd.colorscheme "github_light_default")
