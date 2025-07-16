(set vim.opt.autochdir false)
(set vim.opt.backup false)
(vim.opt.clipboard:prepend "unnamedplus")
(set vim.opt.cmdheight 1)
(set vim.opt.colorcolumn "+1")
(set vim.opt.completeopt ["menuone" "noselect"])
(set vim.opt.conceallevel 0)
(set vim.opt.expandtab true)
(set vim.opt.foldenable false)
(set vim.opt.formatoptions
     {"1" true ;; Don't break a line after a one-letter word.  It's broken before it instead (if possible).
      "c" true ;; Auto-wrap comments using 'textwidth' inserting the current comment leader automatically.
      "j" true ;; Where it makes sense remove a comment leader when joining lines.
      "o" true ;; Automatically insert comment character when pressing "o" or "O" in normal mode
      "n" true ;; When formatting text recognize numbered lists.
      "q" true ;; Allow formatting of comments with "gq".
      "r" true ;; Automatically insert the current comment leader after hitting <Enter> in Insert mode.
      "t" true ;; Auto-wrap text using 'textwidth'
      })
(set vim.opt.ignorecase true)
(set vim.opt.list true)
(set vim.opt.listchars
     {"eol" "¬"
      "nbsp" "+"
      "tab" "> "
      "trail" "~"})
(set vim.opt.modelines 0)
(set vim.opt.mouse "a")
(set vim.opt.number true)
(set vim.opt.pumheight 10)
(set vim.opt.scrolloff 2)
(set vim.opt.shiftwidth 4)
(set vim.opt.shortmess
     {"A" true ;; no "ATTENTION" message when an existing swap file is found
      "c" true ;; don't give ins-completion-menu messages
      "F" true ;; don't give the file info when editing a file
      "f" true ;; use "(3 of 5)" instead of "(file 3 of 5)"
      "i" true ;; use "[noeol]" instead of "[Incomplete last line]"
      "l" true ;; use "999L 888B" instead of "999 lines 888 bytes"
      "n" true ;; use [New] instead of [New file]
      "O" true ;; message for reading a file overwrites any previous message
      "o" true ;; overwrite message for writing a file when reading a file
      "T" true ;; truncate messages in the middle if they are too long to fit on the command line
      "t" true ;; truncate file message
      "x" true ;; [dos] instead of [dos format]
      })
(set vim.opt.showmatch true)
(set vim.opt.showmode false)
(set vim.opt.showtabline 0)
(set vim.opt.signcolumn "yes")
(set vim.opt.softtabstop -1)
(set vim.opt.splitbelow true)
(set vim.opt.splitright true)
(set vim.opt.swapfile false)
(set vim.opt.synmaxcol 1000)
(set vim.opt.tabstop 4)
(set vim.opt.termguicolors true)
(set vim.opt.textwidth 88)
(set vim.opt.title true)
(set vim.opt.undofile true)
(set vim.opt.updatetime 300)
(set vim.opt.visualbell true)
(set vim.opt.whichwrap
     {"b" true ;;  <BS>    Normal and Visual
      "s" true ;;  <Space> Normal and Visual
      "h" true ;;  "h"     Normal and Visual
      "l" true ;;  "l"     Normal and Visual
      "<" true ;;  <Left>  Normal and Visual
      ">" true ;;  <Right> Normal and Visual
      "[" true ;;  <Left>  Insert and Replace ;]
      "]" true ;;  <Right> Insert and Replace
      })
(set vim.opt.wildignore [ "*\\tmp\\*" "*\\target\\*" "*\\out\\*" ])
(set vim.opt.wildignorecase true)

(set vim.g.loaded_netrwPlugin 1)
