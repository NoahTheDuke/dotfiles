-- [nfnl] fnl/noahtheduke/statusline.fnl
_G.Statusline = {}
local currentmode = {n = "NORMAL", no = "NORMALOP", v = "VISUAL", V = "VISUAL-LINE", ["^V"] = "VISUAL-BLOCK", s = "SELECT", S = "SELECT-LINE", ["^S"] = "SELECT-BLOCK", i = "INSERT", R = "REPLACE", Rv = "VISUAL-REPLACE", c = "COMMAND", cv = "VIM EX", ce = "EX", r = "PROMPT", rm = "MORE", ["r?"] = "CONFIRM", ["!"] = "SHELL", t = "TERMINAL"}
local function mode()
  local mode0 = vim.api.nvim_call_function("mode", {})
  local _2_
  do
    local t_1_ = currentmode
    if (nil ~= t_1_) then
      t_1_ = t_1_[mode0]
    else
    end
    _2_ = t_1_
  end
  return (_2_ or "")
end
local function encoding()
  local fenc = vim.bo.fileencoding
  if (fenc == "utf-8") then
    return ""
  else
    return fenc
  end
end
local function filetype()
  return vim.bo.filetype
end
local function lsp_diagnostics()
  local count = vim.diagnostic.count(0)
  local error_cnt = count[vim.diagnostic.severity.ERROR]
  local warn_cnt = count[vim.diagnostic.severity.WARN]
  local info_cnt = count[vim.diagnostic.severity.INFO]
  local status = {}
  if (0 < (error_cnt or 0)) then
    table.insert(status, ("\226\157\140 " .. error_cnt))
  else
  end
  if (0 < (warn_cnt or 0)) then
    table.insert(status, ("\226\154\160\239\184\143 " .. warn_cnt))
  else
  end
  if (0 < (info_cnt or 0)) then
    table.insert(status, ("\240\159\146\161" .. info_cnt))
  else
  end
  return (table.concat(status, " ") .. "%=")
end
_G.Statusline.Line = function()
  local parts = {"%1*", mode(), "%2*", "%F", ("%m%r" .. "%3*"), lsp_diagnostics(), encoding(), "%2*", filetype(), "%1*", "l%l:c%2v,", "%2p%%", "%2LL", ""}
  return table.concat(parts, " ")
end
vim.o.statusline = "%!v:lua._G.Statusline.Line()"
return nil
