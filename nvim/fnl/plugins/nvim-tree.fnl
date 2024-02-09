(local utils (require "utils"))

;; :NvimTreeToggle
[(utils.dep
   "https://github.com/kyazdani42/nvim-tree.lua"
   {:config
    (fn []
      (local nvim-tree (require "nvim-tree"))
      (nvim-tree.setup
        {:renderer
         {:add_trailing true
          :special_files
          ["Cargo.toml"
           "justfile"
           "Makefile"
           "project.clj"
           "package.json"
           "README.md"
           "Readme.md"
           "readme.md"]}}))})]
