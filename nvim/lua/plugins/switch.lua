-- [nfnl] Compiled from fnl/plugins/switch.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function _1_()
  return vim.cmd("\n        augroup switches\n          autocmd FileType lisp let b:switch_custom_definitions =\n          \\ [\n              \\   {\n                    \\     '\"\\(\\k\\+\\)\"': '''\\1',\n                    \\     '''\\(\\k\\+\\)': ':\\1',\n                    \\     ':\\(\\k\\+\\)': '#:\\1',\n                    \\     '#:\\(\\k\\+\\)':  '\"\\1\"\\2',\n                    \\   },\n              \\ ]\n          augroup END\n\n          autocmd FileType fennel let b:switch_custom_definitions =\n          \\ [\n              \\   {\n                    \\     '\"\\(\\k\\+\\)\"': '''\\1',\n                    \\     '''\\(\\k\\+\\)': ':\\1',\n                    \\     ':\\(\\k\\+\\)': '\"\\1\"\\2',\n                    \\   },\n              \\ ]\n        augroup END\n        ")
end
return {utils.dep("https://github.com/AndrewRadev/switch.vim", {name = "switch.vim", config = _1_})}
