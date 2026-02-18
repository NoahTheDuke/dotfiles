(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

[(utils.dep "https://github.com/nvim-lua/plenary.nvim")
 (utils.dep "https://github.com/MunifTanjim/nui.nvim")
 (utils.dep "https://github.com/nvim-tree/nvim-web-devicons")
 (utils.dep
  "https://github.com/nvim-neo-tree/neo-tree.nvim"
  {:branch "v3.x"})]
