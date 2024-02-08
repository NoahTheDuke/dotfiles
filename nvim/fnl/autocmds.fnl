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
