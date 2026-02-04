(import-macros {: callback} "noahtheduke.util-macros")

(λ set-ft [augroup pattern ft]
  (vim.api.nvim_create_autocmd
    ["BufNewFile" "BufReadPost"]
    {:group augroup
     :pattern pattern
     :callback (callback [_args]
                 (vim.api.nvim_set_option_value "filetype" ft {:scope :local}))}))

(let [filetypes-augroup (vim.api.nvim_create_augroup "SetFileTypes" {:clear true})]
  (vim.api.nvim_create_autocmd
    ["Filetype"]
    {:group filetypes-augroup
     :pattern "gitcommit"
     :callback (callback [_args]
                 (vim.api.nvim_set_option_value "spell" true {:scope :local})
                 (vim.api.nvim_set_option_value "textwidth" 80 {:scope :local}))})
  (vim.api.nvim_create_autocmd
    ["TermOpen"]
    {:group filetypes-augroup
     :pattern "*"
     :callback (callback [_args]
                 (vim.api.nvim_set_option_value "spell" false {:scope :local})
                 (vim.api.nvim_set_option_value "number" false {:scope :local})
                 (vim.api.nvim_set_option_value "relativenumber" false {:scope :local}))})
  (vim.api.nvim_create_autocmd
    ["TermOpen" "BufEnter"]
    {:group filetypes-augroup
     :pattern "term://*"
     :command "startinsert"})
  (set-ft filetypes-augroup "*.axvw" "xml")
  (set-ft filetypes-augroup "*.md" "markdown")
  (set-ft filetypes-augroup "*.asd" "lisp")
  (set-ft filetypes-augroup "*.asm" "z80"))

(let [autosave-augroup (vim.api.nvim_create_augroup "autosave" {:clear true})]
  (vim.api.nvim_create_autocmd
    ["FocusLost"]
    {:group autosave-augroup
     :pattern "*"
     :command ":silent! wa"})
  (vim.api.nvim_create_autocmd
    ["FocusGained" "BufEnter"]
    {:group autosave-augroup
     :pattern "*"
     :command ":checktime"}))

(vim.api.nvim_create_autocmd
  ["BufRead" "BufNewFile"]
  {:group (vim.api.nvim_create_augroup "HighlightFullWidthSpace" {:clear true})
   :pattern "*"
   :callback
   (callback [_args]
     (let [weirdSpaces "weirdSpaces"]
       (vim.fn.matchadd weirdSpaces "\\(\\%u000B\\|\\%u000C\\|\\%u0085\\|\\%u00A0\\|\\%u1680\\|\\%u2000\\|\\%u2001\\|\\%u2002\\|\\%u2003\\|\\%u2004\\|\\%u2005\\|\\%u2006\\|\\%u2007\\|\\%u2008\\|\\%u2009\\|\\%u200A\\|\\%u2028\\|\\%u2029\\|\\%u202F\\|\\%u205F\\|\\%u3000\\)")
       (vim.api.nvim_set_hl 0 weirdSpaces
                            {:bg "#a6a6a6"
                             :fg "white"})))})

(vim.api.nvim_create_autocmd
  ["CursorHold"]
  {:group (vim.api.nvim_create_augroup "lspCursorHold" {:clear true})
   :pattern "*"
   :callback (callback [_args]
               (vim.diagnostic.open_float {:header ""
                                           :scope "cursor"}))})
