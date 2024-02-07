-- gs: "abc" -> "abc -> :abc
return {
  "https://github.com/AndrewRadev/switch.vim",
  name = "switch.vim",
  config = function()
    vim.cmd [[
      augroup switches
        autocmd FileType lisp let b:switch_custom_definitions =
          \ [
          \   {
          \     '"\(\k\+\)"': '''\1',
          \     '''\(\k\+\)': ':\1',
          \     ':\(\k\+\)': '#:\1',
          \     '#:\(\k\+\)':  '"\1"\2',
          \   },
          \ ]
      augroup END
    ]]
  end,
}
