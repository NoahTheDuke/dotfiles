set mouse=a

if exists('g:GuiLoaded')
    let g:airline#extensions#tabline#enabled = 0
    set showtabline=2

    GuiAdaptiveColor 1
    GuiAdaptiveFont 1
    GuiAdaptiveStyle Fusion
    GuiFont Fira Code Retina:h12
    GuiPopupmenu 0
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
