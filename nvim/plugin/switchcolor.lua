-- let g:colors = getcompletion('', 'color')
-- func! NextColors()
--     let idx = index(g:colors, g:colors_name)
--     return (idx + 1 >= len(g:colors) ? g:colors[0] : g:colors[idx + 1])
-- endfunc
-- func! PrevColors()
--     let idx = index(g:colors, g:colors_name)
--     return (idx - 1 < 0 ? g:colors[-1] : g:colors[idx - 1])
-- endfunc
-- nnoremap <C-n> :exe "colo " .. NextColors()<CR>
-- nnoremap <C-p> :exe "colo " .. PrevColors()<CR>

local utils = require("utils")

local colors = vim.fn.getcompletion('', 'color')
local colorsToIdx = utils.invertTable(colors)

local nextColor = function()
  local idx = colorsToIdx[vim.g['colors_name']]
  vim.notify("current idx " .. tostring(idx) .. "/" .. tostring(#colors))
  vim.notify("next idx " .. tostring(idx + 1) .. " " .. tostring(colors[idx + 1]))
  if (idx + 1) >= #colors then
    vim.notify("too high " .. tostring(colors[1]))
    return colors[1]
  else
    vim.notify("still under " .. tostring(colors[idx + 1]))
    return colors[idx + 1]
  end
end

local previousColor = function()
  local idx = colorsToIdx[vim.g['colors_name']]
  vim.notify("current idx " .. tostring(idx) .. "/" .. tostring(#colors))
  vim.notify("prev idx " .. tostring(idx - 1) .. " " .. tostring(colors[idx - 1]))
  if (idx - 1) < 1 then
    vim.notify("too low " .. tostring(colors[#colors]))
    return colors[#colors]
  else
    vim.notify("still over " .. tostring(colors[idx - 1]))
    return colors[idx - 1]
  end
end

local opts = { noremap = true, silent = true }
vim.keymap.set(
  "n",
  "<C-F5>",
  function()
    local color = previousColor()
    vim.notify('Colorscheme ' .. color)
    vim.cmd.colorscheme(color)
  end,
  opts
)

vim.keymap.set(
  "n",
  "<C-F6>",
  function()
    local color = nextColor()
    vim.notify('colorscheme ' .. color)
    vim.cmd.colorscheme(color)
  end,
  opts
)
