" settings
let g:coc_default_semantic_highlight_groups = 0

" keybinds
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
augroup highlight
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" Formatting selected code.
vmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
vmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>af  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Apply codelens action
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

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" open url in floating window
command! -nargs=0 Open :call <SID>Open()

function! s:Open()
  let res = CocActionAsync('openLink')
  if res | return | endif
  " match url
  let line = getline('.')
  let url = matchstr(line, '\vhttps?:\/\/[^)\]''" ]+')
  if !empty(url)
    echo 'opening "' . url . '"'
    let output = system('open ' . url)
    if output ==# ''
      let output = system('firefox ' . url)
    endif
  else
    let mail = matchstr(line, '\v([A-Za-z0-9_\.-]+)\@([A-Za-z0-9_\.-]+)\.([a-z\.]+)')
    if !empty(mail)
      let output = system('open mailto:' . mail)
    else
      let output = system('open ' . expand('%:p:h'))
    endif
  endif
  if v:shell_error && output !=# ''
    echoerr output
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    " in a vim or help file
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h ' . expand('<cword>')
    " Connected to an iced repl
    " elseif (iced#nrepl#is_connected())
    "     call iced#repl#execute('document_popup_open', [])
    " coc.nvim is good to go
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    " default
    else
        execute '!' . &keywordprg . ' ' . expand('<cword>')
    endif
endfunction

nnoremap <silent> gd :call <SID>go_to_definition()<CR>

function! s:go_to_definition()
    " Connected to an iced repl
    " if (iced#nrepl#is_connected())
    "     call iced#nrepl#navigate#jump_to_def([])
    " coc.nvim is good to go
    if (coc#rpc#ready())
        call CocActionAsync('jumpDefinition')
    " no default action
    else
        execute ':normal! gd'
    endif
endfunction
