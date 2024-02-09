(local utils (require "utils"))

[(utils.dep
   "https://github.com/LintaoAmons/scratch.nvim"
   {:config
    (fn []
      (vim.api.nvim_create_user_command "Scratch" "<cmd>Scratch<cr>" { :nargs 0 })
      (vim.api.nvim_create_user_command "ScratchWithName" "<cmd>ScratchWithName<cr>" { :nargs 0 })
      (vim.api.nvim_create_user_command "ScratchOpen" "<cmd>ScratchOpen<cr>" { :nargs 0 }))})]
