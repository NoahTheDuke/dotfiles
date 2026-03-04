(import-macros {: callback} "noahtheduke.util-macros")

(set _G.Statusline {})

(local currentmode
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

(λ mode []
  (let [mode (vim.api.nvim_call_function "mode" {})]
    (or (?. currentmode mode) "")))

(λ encoding []
  (let [fenc vim.bo.fileencoding]
    (if (= fenc "utf-8")
      ""
      fenc)))

(λ filetype []
  vim.bo.filetype)

(λ lsp-diagnostics []
  (let [count (vim.diagnostic.count 0)
        error-cnt (. count vim.diagnostic.severity.ERROR)
        warn-cnt (. count vim.diagnostic.severity.WARN)
        info-cnt (. count vim.diagnostic.severity.INFO)
        status []]
    (if (< 0 (or error-cnt 0))
      (table.insert status (.. "\u{274c} " error-cnt)))
    (if (< 0 (or warn-cnt 0))
      (table.insert status (.. "\u{26a0}\u{fe0f} " warn-cnt)))
    (if (< 0 (or info-cnt 0))
      (table.insert status (.. "\u{1F4A1}" info-cnt)))
    (.. (table.concat status " ") "%=")))

(λ _G.Statusline.Line []
  (let [parts [;; set purple background
               "%1*"
               ;; display custom mode names
               (mode)
               ;; set light grey background
               "%2*"
               ;; display full-path filename
               "%F"
               ;; concat to avoid extra spaces
               (..
                 ;; display modified or read only status
                 "%m%r"
                 ;; set dark grey background
                 "%3*")
               ;; display any diagnostics
               (lsp-diagnostics)
               ;; display encoding if not utf-8
               (encoding)
               ;; set light grey background
               "%2*"
               ;; display filetype
               (filetype)
               ;; set purple background
               "%1*"
               ;; line and column of cursor
               "l%l:c%2v,"
               ;; percentage through file
               "%2p%%"
               ;; total number of lines
               "%2LL"
               ""]]
    (table.concat parts " ")))

(set vim.o.statusline "%!v:lua._G.Statusline.Line()")

nil
