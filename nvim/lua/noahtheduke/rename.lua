-- [nfnl] fnl/noahtheduke/rename.fnl
local function rename(_1_)
  local name = _1_.args
  local bang = _1_.bang
  if (nil == bang) then
    _G.error("Missing argument bang on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/rename.fnl:3", 2)
  else
  end
  if (nil == name) then
    _G.error("Missing argument name on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/rename.fnl:3", 2)
  else
  end
  local cur_file = vim.fn.expand("%:p")
  local cur_file_stripped = vim.fn.substitute(cur_file, " ", "\\\\ ", "g")
  local cur_file_path = vim.fn.expand("%:p:h")
  local new_name = vim.fn.substitute((cur_file_path .. "/" .. name), " ", "\\\\ ", "g")
  vim.v.errmsg = ""
  vim.print("fuck")
  vim.cmd({cmd = "saveas", args = {new_name}, bang = bang})
  if string.find(vim.v.errmsg, "^$|^E329") then
    local new_cur_file = vim.fn.expand("%:p")
    if ((cur_file ~= new_cur_file) and vim.fn.filewritable(new_cur_file)) then
      vim.cmd.bwipe(cur_file_stripped, {bang = true})
      if (0 ~= vim.fn.delete(cur_file)) then
        return vim.notify(("Could not delete " .. cur_file), vim.log.levels.ERROR)
      else
        return nil
      end
    else
      return nil
    end
  else
    return vim.notify(vim.v.errmsg, vim.log.levels.ERROR)
  end
end
local function _7_(opts)
  if (nil == opts) then
    _G.error("Missing argument opts on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/rename.fnl:22", 2)
  else
  end
  return rename(opts)
end
return vim.api.nvim_create_user_command("Rename", _7_, {nargs = "*", complete = "file_in_path", bang = true})
