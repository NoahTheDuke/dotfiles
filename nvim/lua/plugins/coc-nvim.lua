vim.cmd([[
" settings
let g:coc_default_semantic_highlight_groups = 1

augroup CocConfigSyntax
    au BufRead,BufNewFile coc-settings.json setfiletype jsonc
augroup END

" keybinds
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

  " Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1):
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Auto-select the first completion item and notify coc.nvim to format on enter
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
" augroup highlight
"     autocmd CursorHold * silent call CocActionAsync('highlight')
" augroup END

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
vmap <leader>f  <Plug>(coc-format-selected)
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>af  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>cla <Plug>(coc-codelens-action)

" Map function and class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_float() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_float() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_float() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_float() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_float() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_float() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" open url in floating window
command! -nargs=0 Open :call CocActionAsync('openLink')
]])


-- Mappings for CoCList
local coc_list = {
  { lhs = "<space>a", rhs = ":<C-u>CocList diagnostics<cr>" },
  { lhs = "<space>e", rhs = ":<C-u>CocList extensions<cr>" },
  { lhs = "<space>c", rhs = ":<C-u>CocList commands<cr>" },
  { lhs = "<space>o", rhs = ":<C-u>CocList outline<cr>" },
  { lhs = "<space>s", rhs = ":<C-u>CocList -I symbols<cr>" },
  { lhs = "<space>j", rhs = ":<C-u>CocNext<CR>" },
  { lhs = "<space>k", rhs = ":<C-u>CocPrev<CR>" },
  { lhs = "<space>p", rhs = ":<C-u>CocListResume<CR>" },
}
for _, v in ipairs(coc_list) do
  vim.api.nvim_set_keymap("n", v.lhs, v.rhs, {
    nowait = true,
    noremap = true,
    silent = true,
  })
end


function Coc_go_to_definition()
  if vim.call("coc#rpc#ready") and vim.fn.CocAction("hasProvider", "definition") then
    vim.fn.CocActionAsync("jumpDefinition")
  end
end

vim.api.nvim_set_keymap("n", "gd", ":lua Coc_go_to_definition()<CR>", {
  noremap = true,
  silent = true,
})

function Coc_show_documentation()
  local filetype = vim.bo.filetype

  if filetype == "vim"  or filetype == "help" then
    vim.api.nvim_command("h " .. filetype)
  elseif vim.fn.CocAction('hasProvider', 'hover') then
    vim.fn.CocActionAsync("doHover")
  end
end

vim.api.nvim_set_keymap('n', 'K', ':lua Coc_show_documentation()<CR>', {
  noremap = true,
  silent = true,
})
