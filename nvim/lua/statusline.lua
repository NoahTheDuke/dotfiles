-- [nfnl] nvim/fnl/statusline.fnl
_G.Statusline = {}
_G.currentmode = {n = "NORMAL", no = "NORMALOP", v = "VISUAL", V = "VISUAL-LINE", ["^V"] = "VISUAL-BLOCK", s = "SELECT", S = "SELECT-LINE", ["^S"] = "SELECT-BLOCK", i = "INSERT", R = "REPLACE", Rv = "VISUAL-REPLACE", c = "COMMAND", cv = "VIM EX", ce = "EX", r = "PROMPT", rm = "MORE", ["r?"] = "CONFIRM", ["!"] = "SHELL", t = "TERMINAL"}
_G.Statusline.Mode = function()
  local mode = vim.api.nvim_call_function("mode", {})
  local _2_
  do
    local t_1_ = _G.currentmode
    if (nil ~= t_1_) then
      t_1_ = t_1_[mode]
    else
    end
    _2_ = t_1_
  end
  return (_2_ or "")
end
_G.Statusline.Encoding = function()
  local fenc = vim.bo.fileencoding
  if (fenc == "utf-8") then
    return ""
  else
    return fenc
  end
end
_G.Statusline.Filetype = function()
  return vim.bo.filetype
end
_G.Statusline.Lsp = function()
  local count = {[vim.diagnostic.severity.ERROR] = 0, [vim.diagnostic.severity.WARN] = 0, [vim.diagnostic.severity.INFO] = 0, [vim.diagnostic.severity.HINT] = 0}
  for _, diagnostic in ipairs(vim.diagnostic.get(0)) do
    local ns = vim.diagnostic.get_namespace(diagnostic.namespace).name
    if vim.startswith(ns, "vim.lsp") then
      count[diagnostic.severity] = (1 + count[diagnostic.severity])
    else
    end
  end
  local status = {}
  local error_cnt = count[vim.diagnostic.severity.ERROR]
  local warn_cnt = count[vim.diagnostic.severity.WARN]
  local info_cnt = count[vim.diagnostic.severity.INFO]
  if (0 < error_cnt) then
    table.insert(status, ("\226\157\140 " .. error_cnt))
  else
  end
  if (0 < warn_cnt) then
    table.insert(status, ("\226\154\160\239\184\143 " .. warn_cnt))
  else
  end
  if (0 < info_cnt) then
    table.insert(status, ("\240\159\146\161" .. info_cnt))
  else
  end
  return table.concat(status, " ")
end
vim.cmd("\nset laststatus=2\nset statusline=%1*\nset statusline+=\\ \nset statusline+=%{v:lua._G.Statusline.Mode()}\nset statusline+=\\ \nset statusline+=%2*\nset statusline+=\\ \nset statusline+=%F\nset statusline+=\\ \nset statusline+=%m\nset statusline+=%r\nset statusline+=%3*\nset statusline+=\\ \nset statusline+=%{v:lua._G.Statusline.Lsp()}\nset statusline+=%=\nset statusline+=\\ \nset statusline+=%{v:lua._G.Statusline.Encoding()}\nset statusline+=\\ \nset statusline+=%2*\nset statusline+=\\ \nset statusline+=%{v:lua._G.Statusline.Filetype()}\nset statusline+=\\ \nset statusline+=%1*\nset statusline+=\\ \nset statusline+=l%l:c%2v,\\ %2p%%\\ %2LL\nset statusline+=\\ \n")
return nil
