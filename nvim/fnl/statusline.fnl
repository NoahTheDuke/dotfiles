(set _G.Statusline {})

(set _G.currentmode
  {"n" "NORMAL"
   "no" "NORMALOP"
   "v" "VISUAL"
   "V" "VISUAL-LINE"
   "^V" "VISUAL-BLOCK"
   "s" "SELECT"
   "S" "SELECT-LINE"
   "^S" "SELECT-BLOCK"
   "i" "INSERT"
   "R" "REPLACE"
   "Rv" "VISUAL-REPLACE"
   "c" "COMMAND"
   "cv" "VIM EX"
   "ce" "EX"
   "r" "PROMPT"
   "rm" "MORE"
   "r?" "CONFIRM"
   "!" "SHELL"
   "t" "TERMINAL"})

(fn _G.Statusline.Mode []
  (local mode (vim.api.nvim_call_function "mode" {}))
  (or (?. _G.currentmode mode) ""))

(fn _G.Statusline.Encoding []
  (local fenc vim.bo.fileencoding)
  (if (= fenc "utf-8")
    ""
    fenc))

(fn _G.Statusline.Filetype []
  vim.bo.filetype)

(fn _G.Statusline.Lsp []
  (local count {vim.diagnostic.severity.ERROR 0
                vim.diagnostic.severity.WARN 0
                vim.diagnostic.severity.INFO 0
                vim.diagnostic.severity.HINT 0})
  (each [_ diagnostic (ipairs (vim.diagnostic.get 0))]
    (local ns (. (vim.diagnostic.get_namespace diagnostic.namespace) :name))
    (if (vim.startswith ns "vim.lsp")
      (tset count diagnostic.severity (+ 1 (. count diagnostic.severity)))))
  (local status [])
  (local error-cnt (. count vim.diagnostic.severity.ERROR))
  (local warn-cnt (. count vim.diagnostic.severity.WARN))
  (local info-cnt (. count vim.diagnostic.severity.INFO))
  (if (< 0 error-cnt)
    (table.insert status (.. "\u{274c} " error-cnt)))
  (if (< 0 warn-cnt)
    (table.insert status (.. "\u{26a0}\u{fe0f} " warn-cnt)))
  (if (< 0 info-cnt)
    (table.insert status (.. "\u{1F4A1}" info-cnt)))
  (table.concat status " "))

(vim.cmd "
set laststatus=2
set statusline=%1*
set statusline+=\\ 
set statusline+=%{v:lua._G.Statusline.Mode()}
set statusline+=\\ 
set statusline+=%2*
set statusline+=\\ 
set statusline+=%F
set statusline+=\\ 
set statusline+=%m
set statusline+=%r
set statusline+=%3*
set statusline+=\\ 
set statusline+=%{v:lua._G.Statusline.Lsp()}
set statusline+=%=
set statusline+=\\ 
set statusline+=%{v:lua._G.Statusline.Encoding()}
set statusline+=\\ 
set statusline+=%2*
set statusline+=\\ 
set statusline+=%{v:lua._G.Statusline.Filetype()}
set statusline+=\\ 
set statusline+=%1*
set statusline+=\\ 
set statusline+=l%l:c%2v,\\ %2p%%\\ %2LL
set statusline+=\\ 
")

nil
