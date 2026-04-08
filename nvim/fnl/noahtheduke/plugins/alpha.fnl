(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ ->footer [?lazy-plugins]
  (let [vim-version (vim.version)
        version (.. " " vim-version.major "." vim-version.minor "." vim-version.patch)]
    (if (= nil ?lazy-plugins)
      version
      (let [cnt (length ?lazy-plugins)]
        (.. version "   " cnt " Plugins")))))

(λ setup []
  (when-require [alpha "alpha"
                 dashboard "alpha.themes.dashboard"
                 headers "utils.headers"]
    (math.randomseed (os.time))
    (let [{: header
           : buttons
           : footer} (vim.deepcopy dashboard.section)]

      (set header.val (headers.random))
      (set header.opts.hl "AlphaHeader")

      (set buttons.val
           [(dashboard.button "s" "  Load Session" ":SessionManager load_current_dir_session<CR>")
            (dashboard.button "r" "  Recent Files" ":Telescope oldfiles<CR>")
            (dashboard.button "n" "  New file" ":ene <BAR> startinsert <CR>")
            (dashboard.button "f" "  Find File" ":Telescope find_files<CR>")
            (dashboard.button "t" "  Find Text" ":Telescope live_grep<CR>")
            (dashboard.button "c" "  Configuration" ":e $MYVIMRC<CR>:cd %:h/../<CR>")
            (dashboard.button "q" "  Quit Neovim" ":qa!<CR>")])
      (set buttons.opts.hl "AlphaButton")

      (let [lazy-plugins (vim.tbl_map (λ [plugin] plugin.name)
                                      (let [lazy (require "lazy")]
                                        (lazy.plugins)))]
        (set footer.val (->footer lazy-plugins)))
      (set footer.opts.hl "AlphaFooter")

      (let [config
            {:layout [{:type :padding :val 2}
                      header
                      {:type :padding :val 2}
                      ; {:type :text
                      ;  :val "poop"
                      ;  :opts {:position "center"}}
                      ; {:type :padding :val 2}
                      buttons
                      footer]
             :opts {:margin 5
                    :noautocmd true}}]

        (alpha.setup config)))))

;; Splash screen
(utils.dep
  "https://github.com/goolord/alpha-nvim"
  {:config
   (fn [_plugin _opts run]
     (if run
       (setup)))})
