(local utils (require "utils"))

(fn config []
  (local sidebar (require "sidebar-nvim"))
  (sidebar.setup {:sections ["datetime" "buffers" "files" "git"]
                  :files {:icon ""
                          :show_hidden false
                          :ignored_paths ["%.git$"]}}))

(comment
  (config))

[(utils.dep
   "https://github.com/sidebar-nvim/sidebar.nvim"
   {:config config})]
