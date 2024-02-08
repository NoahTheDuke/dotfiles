(local utils (require :utils))

;; gs: "abc" -> "abc -> :abc
[(utils.dep
   "https://github.com/AndrewRadev/switch.vim"
   {:name "switch.vim"
    :config
    (fn []
      (vim.cmd
        "
        augroup switches
          autocmd FileType lisp let b:switch_custom_definitions =
          \\ [
              \\   {
                    \\     '\"\\(\\k\\+\\)\"': '''\\1',
                    \\     '''\\(\\k\\+\\)': ':\\1',
                    \\     ':\\(\\k\\+\\)': '#:\\1',
                    \\     '#:\\(\\k\\+\\)':  '\"\\1\"\\2',
                    \\   },
              \\ ]
          augroup END

          autocmd FileType fennel let b:switch_custom_definitions =
          \\ [
              \\   {
                    \\     '\"\\(\\k\\+\\)\"': '''\\1',
                    \\     '''\\(\\k\\+\\)': ':\\1',
                    \\     ':\\(\\k\\+\\)': '\"\\1\"\\2',
                    \\   },
              \\ ]
        augroup END
        ")
      )})]
