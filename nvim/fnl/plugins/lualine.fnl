(local utils (require "utils"))

[(utils.dep
   "https://github.com/nvim-lualine/lualine.nvim"
   {:name "lualine.nvim"
    :config
    (fn []
      (let [lualine (require "lualine")]
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
                        "%{coc#status()}"]
            :lualine_c []
            :lualine_x [["encoding" "fileformat"]]
            :lualine_y [{1 "filetype"
                         :colored true}]
            :lualine_z [["%3p%%/%4L %4l:%3v"]]}
           :tabline {:lualine_a ["buffers"]
                     :lualine_b []
                     :lualine_c []
                     :lualine_x []
                     :lualine_y []
                     :lualine_z ["tabs"]}
           :extensions ["quickfix" "nvim-tree"]})))})]
