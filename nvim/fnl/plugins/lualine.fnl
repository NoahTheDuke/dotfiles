(local utils (require "utils"))

(fn config []
  (local lualine (require "lualine"))
  (lualine.setup
    {:options
     {:component_separators { :left "" :right "" }
      :section_separators { :left "" :right "" }
      :theme "auto"}
     :sections
     {:lualine_a [ "mode" ]
      :lualine_b [{1 "filename"
                   :file_status true
                   :path 1
                   :symbols {:modified "  "
                             :readonly "[-]"
                             :unnamed "[No Name]"}}
                  {1 "diagnostics"
                   :sources [ "coc" ]}
                  ["g:coc_status" "bo:filetype"]]
      :lualine_c []
      :lualine_x ["encoding"]
      :lualine_y [{1 "filetype"
                   :colored true}]
      :lualine_z [["%3p%%/%4L %4l:%3v"]]}
     :extensions ["quickfix" "nvim-tree"]}))

(comment
  (config))

[(utils.dep
   "https://github.com/nvim-lualine/lualine.nvim"
   {:config config})]
