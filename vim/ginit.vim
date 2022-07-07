set mouse=a

" neovim-qt settings
if exists('g:GuiLoaded')
    let g:airline#extensions#tabline#enabled = 0
    set showtabline=2

    GuiAdaptiveColor 1
    GuiAdaptiveFont 1
    GuiAdaptiveStyle Fusion
    GuiFont Fira Code Retina Nerd Font Complete:h14
    GuiPopupmenu 1
    GuiRenderLigatures 1
    GuiScrollBar 1
    GuiTabline 1

    " Right Click Context Menu (Copy-Cut-Paste)
    nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
    inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
    xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
    snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

    command! -nargs=? GuiNewWindow call GuiNewWindow("<args>")
endif

" vimr settings
if has("gui_vimr")
    " let g:airline#extensions#tabline#enabled = 1
    " set showtabline=2

    VimRSetFontAndSize "Fira Code Retina Nerd Font Complete", 14
endif
