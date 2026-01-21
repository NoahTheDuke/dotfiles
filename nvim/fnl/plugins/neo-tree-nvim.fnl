(local utils (require :utils))
(import-macros {: when-require} :nvim/fnl/util-macros)

(utils.dep
  "https://github.com/nvim-neo-tree/neo-tree.nvim"
  {:branch "v3.x"
   :dependencies [ "nvim-lua/plenary.nvim" "MunifTanjim/nui.nvim" "nvim-tree/nvim-web-devicons" ]
   :lazy false})
