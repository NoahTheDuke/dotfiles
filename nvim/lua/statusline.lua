-- [nfnl] nvim/fnl/statusline.fnl
_G.Statusline = {}
vim.cmd("\nset laststatus=2\nset statusline=\nset statusline+=%1*\nset statusline+=\\ \nset statusline+=%{v:lua._G.Statusline.Mode()}\nset statusline+=\\ \nset statusline+=%2*\nset statusline+=\\ \nset statusline+=%F\nset statusline+=\\ \nset statusline+=%m\nset statusline+=%r\nset statusline+=%3*\nset statusline+=\\ \nset statusline+=%{coc#status()}\nset statusline+=%=\nset statusline+=\\ \nset statusline+=%2*\nset statusline+=\\ \nset statusline+=%{&fenc==\\\"\\\"?&enc:&fenc}\nset statusline+=\\ \nset statusline+=%y\nset statusline+=\\ \nset statusline+=%1*\nset statusline+=\\ \nset statusline+=l%l:c%2v,\\ %2p%%\\ of\\ %2L\\ Lines\nset statusline+=\\ \n")
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
return nil
