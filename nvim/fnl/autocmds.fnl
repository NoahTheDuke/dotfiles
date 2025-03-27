(vim.cmd
  "
  augroup filetypes
    autocmd Filetype gitcommit setlocal spell textwidth=80
    autocmd BufNewFile,BufReadPost *.axvw set filetype=xml
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    autocmd BufNewFile,BufReadPost *.asd set filetype=lisp
    autocmd BufNewFile,BufReadPost *.asm set filetype=z80
    autocmd TermOpen * setlocal nospell nonumber norelativenumber
    autocmd TermOpen,BufEnter term://* startinsert
  augroup END
  ")

(vim.cmd
  "
  augroup autosave
    autocmd FocusLost * :wa
    autocmd FocusGained,BufEnter * :checktime
  augroup END
  ")

(vim.api.nvim_create_autocmd
  ["BufRead" "BufNewFile"]
  {:group (vim.api.nvim_create_augroup "HighlightFullWidthSpace" {})
   :pattern "*"
   :callback
   (fn []
     (local weirdSpaces "weirdSpaces")
     (vim.fn.matchadd weirdSpaces "\\(\\%u000B\\|\\%u000C\\|\\%u0085\\|\\%u00A0\\|\\%u1680\\|\\%u2000\\|\\%u2001\\|\\%u2002\\|\\%u2003\\|\\%u2004\\|\\%u2005\\|\\%u2006\\|\\%u2007\\|\\%u2008\\|\\%u2009\\|\\%u200A\\|\\%u2028\\|\\%u2029\\|\\%u202F\\|\\%u205F\\|\\%u3000\\)")

     (vim.api.nvim_set_hl 0 weirdSpaces
                          {:bg "#a6a6a6"
                           :fg "white"}))})
