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

(vim.cmd "
set laststatus=2
set statusline=
set statusline+=%1*
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
\" set statusline+=%{coc#status()}
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
