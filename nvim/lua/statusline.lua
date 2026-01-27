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
vim.cmd("\nset laststatus=2\nset statusline=\nset statusline+=%1*\nset statusline+=\\ \nset statusline+=%{v:lua._G.Statusline.Mode()}\nset statusline+=\\ \nset statusline+=%2*\nset statusline+=\\ \nset statusline+=%F\nset statusline+=\\ \nset statusline+=%m\nset statusline+=%r\nset statusline+=%3*\nset statusline+=\\ \n\" set statusline+=%{coc#status()}\nset statusline+=%=\nset statusline+=\\ \nset statusline+=%{v:lua._G.Statusline.Encoding()}\nset statusline+=\\ \nset statusline+=%2*\nset statusline+=\\ \nset statusline+=%{v:lua._G.Statusline.Filetype()}\nset statusline+=\\ \nset statusline+=%1*\nset statusline+=\\ \nset statusline+=l%l:c%2v,\\ %2p%%\\ %2LL\nset statusline+=\\ \n")
return nil
