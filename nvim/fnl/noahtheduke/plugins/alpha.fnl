(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke/util-macros")

(fn setup []
  (when-require [alpha "alpha"
                 dashboard "alpha.themes.dashboard"
                 headers "utils.headers"]
    (let [lazy_plugins
          (vim.tbl_map (fn [plugin] plugin.name)
                       (let [lazy (require "lazy")]
                         (lazy.plugins)))]

      (math.randomseed (os.time))
      (set dashboard.section.header.val (headers.random))

      (set dashboard.section.buttons.val
           [(dashboard.button "s" "  Load Session" ":SessionManager load_current_dir_session<CR>")
            (dashboard.button "r" "  Recent Files" ":Telescope oldfiles<CR>")
            (dashboard.button "n" "  New file" ":ene <BAR> startinsert <CR>")
            (dashboard.button "f" "  Find File" ":Telescope find_files<CR>")
            (dashboard.button "t" "  Find Text" ":Telescope live_grep<CR>")
            (dashboard.button "c" "  Configuration" ":e $MYVIMRC<CR>:cd %:h/../<CR>")
            (dashboard.button "q" "  Quit Neovim" ":qa!<CR>")])

      (fn footer []
        (let [vim-version (vim.version)
              version (.. " " vim-version.major "." vim-version.minor "." vim-version.patch)]
          (if (= lazy_plugins nil)
            version
            (let [cnt (length lazy_plugins)
                  total_plugins (.. "   " cnt " Plugins")]
              (.. version total_plugins)))))

      (set dashboard.section.footer.val (footer))

      (set dashboard.section.footer.opts.hl "AlphaFooter")
      (set dashboard.section.header.opts.hl "AlphaHeader")
      (set dashboard.section.buttons.opts.hl "AlphaButton")

      (set dashboard.opts.opts.noautocmd true)
      (alpha.setup dashboard.opts))))

;; Splash screen
(utils.dep
  "https://github.com/goolord/alpha-nvim"
  {:config
   (fn [_plugin _opts run]
     (if run
       (setup)))})
