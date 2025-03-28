(local utils (require "utils"))

(local opts {:noremap true :silent true})
(local scroll_opts {:silent true :nowait true :expr true})
(local keyset vim.keymap.set)

(fn coc_command [name ...]
  (local vargs [...])
  (set vargs.n (select "#" ...))
  (vim.api.nvim_create_user_command
    name
    (fn [] (vim.fn.CocActionAsync (unpack vargs)))
    { :nargs 0 }))

(fn config []
  ;; settings
  (set vim.g.coc_default_semantic_highlight_groups 1)

  (vim.api.nvim_create_autocmd
    ["BufRead" "BufNewFile"]
    {:group (vim.api.nvim_create_augroup "CocConfigSyntax" {})
     :pattern ["coc-settings.json"]
     :command "set filetype=jsonc"})

  ;; Auto-select the first completion item and notify coc.nvim to format on enter
  (vim.api.nvim_set_keymap "i" "<cr>" "coc#pum#visible() ? coc#pum#confirm() : \"<CR>\"" scroll_opts)

  ;; Use `[g` and `]g` to navigate diagnostics
  ;; Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  (keyset "n" "[g" "<Plug>(coc-diagnostic-prev)") ;]
  (keyset "n" "]g" "<Plug>(coc-diagnostic-next)")

  (keyset "n" "<leader>rn" "<Plug>(coc-rename)")
  (keyset "n" "<leader>rf" "<Plug>(coc-refactor)")
  (keyset "v" "<leader>f" "<Plug>(coc-format-selected)")
  (keyset "v" "<leader>a" "<Plug>(coc-codeaction-selected)")
  (keyset "n" "<leader>ac" "<Plug>(coc-codeaction-cursor)")
  (keyset "n" "<leader>af" "<Plug>(coc-codeaction)")
  (keyset "n" "<leader>qf" "<Plug>(coc-fix-current)")
  (keyset "n" "<leader>cla" "<Plug>(coc-codelens-action)")

  (keyset "n" "gd" "<Plug>(coc-definition)" opts)
  (keyset "n" "<leader>gi" "<Plug>(coc-implementation)" opts)
  (keyset "n" "<leader>gr" "<Plug>(coc-references)" opts)
  (keyset "n" "<leader>gy" "<Plug>(coc-type-definition)" opts)


  ;; Map function and class text objects
  (keyset { "x" "o" } "if" "<Plug>(coc-funcobj-i)")
  (keyset { "x" "o" } "af" "<Plug>(coc-funcobj-a)")
  (keyset { "x" "o" } "ic" "<Plug>(coc-classobj-i)")
  (keyset { "x" "o" } "ac" "<Plug>(coc-classobj-a)")

  ;; Remap <C-f> and <C-b> for scroll float windows/popups.
  (keyset { "n" "v" } "<C-f>" "coc#float#has_scroll() ? coc#float#scroll(1) : \"<C-f>\"" scroll_opts)
  (keyset { "n" "v" } "<C-b>" "coc#float#has_scroll() ? coc#float#scroll(0) : \"<C-b>\"" scroll_opts)
  (keyset "i" "<C-f>" "coc#float#has_scroll() ? \"<c-r>=coc#float#scroll(1)<cr>\" : \"<Right>\"" scroll_opts)
  (keyset "i" "<C-b>" "coc#float#has_scroll() ? \"<c-r>=coc#float#scroll(0)<cr>\" : \"<Left>\"" scroll_opts)

  (keyset { "n" "x" } "<C-s>" "<Plug>(coc-range-select)" opts)

  (coc_command "Format" "format")
  (coc_command "OR" "runCommand" "editor.action.organizeImport")
  (coc_command "Open" "openLink")

  (fn _G.Coc_show_documentation []
    (local filetype vim.bo.filetype)
    (if
      (or (= filetype "vim")
          (= filetype "help"))
      (vim.api.nvim_command (.. "h " filetype))
      (and (vim.cmd "coc#rpc#ready")
           (vim.fn.CocAction "hasProvider" "hover"))
      (vim.fn.CocActionAsync "doHover"))
    nil)

  (fn _G.show_docs []
    (local cw (vim.fn.expand "<cword>"))
    (if
      ;; vim help
      (<= 0 (vim.fn.index ["vim" "help"] vim.bo.filetype))
      (vim.api.nvim_command (.. "h " cw))
      ;; hover
      (vim.api.nvim_eval "coc#rpc#ready()")
      (vim.fn.CocActionAsync "doHover")
      ;; default
      (vim.api.nvim_command (.. "!" vim.o.keywordprg " " cw)))
    nil)

  (keyset "n" "K" _G.show_docs opts))

[(utils.dep
   "https://github.com/neoclide/coc.nvim"
   {:branch "release"
    :config config})]
