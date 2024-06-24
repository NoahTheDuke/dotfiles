(local utils (require "utils"))

;; :SessionManager
(utils.dep
  "https://github.com/Shatur/neovim-session-manager"
  {:dependencies ["nvim-lua/plenary.nvim"]
   :config
   (fn []
     (let [session-manager (require "session_manager")
           config (require "session_manager.config")]
       (session-manager.setup
         {:autoload_mode config.AutoloadMode.Disabled
          :autosave_only_in_session false})))})
