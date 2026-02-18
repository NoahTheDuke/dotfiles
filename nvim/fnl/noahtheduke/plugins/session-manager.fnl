(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

;; :SessionManager
[(utils.dep
   "https://github.com/nvim-lua/plenary.nvim")
 (utils.dep
   "https://github.com/Shatur/neovim-session-manager"
   {:config
    (λ []
      (when-require [session-manager "session_manager"
                     config "session_manager.config"]
        (session-manager.setup
          {:autoload_mode config.AutoloadMode.Disabled
           :autosave_only_in_session false})))})]
