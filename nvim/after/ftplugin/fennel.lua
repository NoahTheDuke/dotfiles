vim.cmd [[
setlocal iskeyword=!,$,%,#,*,+,-,/,<,=,>,?,_,a-z,A-Z,48-57,128-247,124,126,38,94,:
]]

vim.bo.includeexpr = [[v:lua.require'noahtheduke.utils'.fennel_includeexpr(v:fname)]]
