-- [nfnl] fnl/noahtheduke/lsp/clojure.fnl
local edn = require("edn")
local clojure_lsp_commands = (vim.fn.stdpath("config") .. "/data/clojure-lsp-commands.edn")
local function get_uri_and_pos()
  local _let_1_ = vim.api.nvim_win_get_cursor(0)
  local row = _let_1_[1]
  local col = _let_1_[2]
  local uri = vim.uri_from_bufnr(0)
  return {uri, (row - 1), col}
end
local function get_client(name)
  if (nil == name) then
    _G.error("Missing argument name on fnl/noahtheduke/lsp/clojure.fnl:12", 2)
  else
  end
  return vim.lsp.get_clients({name = name})[1]
end
local function execute_positional_command(cmd, _3fargs)
  if (nil == cmd) then
    _G.error("Missing argument cmd on fnl/noahtheduke/lsp/clojure.fnl:15", 2)
  else
  end
  local client = get_client("clojure-lsp")
  local _let_4_ = get_uri_and_pos()
  local uri = _let_4_[1]
  local row = _let_4_[2]
  local col = _let_4_[3]
  local function _5_()
    if ("string" == type(_3fargs)) then
      return _3fargs
    else
      return unpack((_3fargs or {}))
    end
  end
  client:exec_cmd({command = cmd.command, arguments = {uri, row, col, _5_()}})
  return vim.api.nvim__redraw({buf = 0, flush = true})
end
local function execute_prompt_command(cmd, _3fargs)
  if (nil == cmd) then
    _G.error("Missing argument cmd on fnl/noahtheduke/lsp/clojure.fnl:24", 2)
  else
  end
  local prompt = cmd.prompt
  if not _3fargs then
    local function _7_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.input({prompt = (prompt .. " ")}, _7_)
  else
    local function _9_()
      local t_8_ = _3fargs
      if (nil ~= t_8_) then
        t_8_ = t_8_.args
      else
      end
      return t_8_
    end
    return execute_positional_command(cmd, _9_())
  end
end
local function execute_choice_command(cmd, _3fargs)
  if (nil == cmd) then
    _G.error("Missing argument cmd on fnl/noahtheduke/lsp/clojure.fnl:30", 2)
  else
  end
  local prompt = cmd.prompt
  local choices = cmd.choices
  if not _3fargs then
    local function _13_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.select(choices, {prompt = prompt}, _13_)
  else
    local function _15_()
      local t_14_ = _3fargs
      if (nil ~= t_14_) then
        t_14_ = t_14_.args
      else
      end
      return t_14_
    end
    return execute_positional_command(cmd, _15_())
  end
end
local function get_command_fn(cmd)
  if (nil == cmd) then
    _G.error("Missing argument cmd on fnl/noahtheduke/lsp/clojure.fnl:36", 2)
  else
  end
  local case_19_ = cmd.type
  if (case_19_ == "positional") then
    local function _20_(_args)
      return execute_positional_command(cmd, nil)
    end
    return _20_
  elseif (case_19_ == "prompt") then
    local function _21_(args)
      if (nil == args) then
        _G.error("Missing argument args on fnl/noahtheduke/lsp/clojure.fnl:39", 2)
      else
      end
      return execute_prompt_command(cmd, args)
    end
    return _21_
  elseif (case_19_ == "choice") then
    local function _23_(args)
      if (nil == args) then
        _G.error("Missing argument args on fnl/noahtheduke/lsp/clojure.fnl:40", 2)
      else
      end
      return execute_choice_command(cmd, args)
    end
    return _23_
  else
    return nil
  end
end
local function register_keymaps(commands)
  if (nil == commands) then
    _G.error("Missing argument commands on fnl/noahtheduke/lsp/clojure.fnl:42", 2)
  else
  end
  for _, cmd in ipairs(commands) do
    if cmd.shortcut then
      vim.keymap.set("n", ("<leader>cl" .. cmd.shortcut), get_command_fn(cmd), {silent = true, noremap = true, desc = ("clojure-lsp-" .. cmd.command)})
    else
    end
  end
  return nil
end
local function register_commands(commands)
  if (nil == commands) then
    _G.error("Missing argument commands on fnl/noahtheduke/lsp/clojure.fnl:51", 2)
  else
  end
  local errors_29_ = {}
  local _30_, textcase
  local function _31_()
    return require("textcase")
  end
  local function _32_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/lsp/clojure.fnl:52", 2)
    else
    end
    return table.insert(errors_29_, debug.traceback(err_2_auto))
  end
  _30_, textcase = xpcall(_31_, _32_)
  if _30_ then
    for _, cmd in ipairs(commands) do
      local nargs
      if cmd.positional then
        nargs = "0"
      else
        nargs = "?"
      end
      vim.api.nvim_create_user_command(("CljLsp" .. textcase.api.to_pascal_case(cmd.command)), get_command_fn(cmd), {nargs = nargs})
    end
    local function _35_()
      local _let_36_ = get_uri_and_pos()
      local uri = _let_36_[1]
      local row = _let_36_[2]
      local col = _let_36_[3]
      return vim.lsp.buf_notify(0, "clojure/cursorInfo/log", {textDocument = {uri = uri}, position = {line = row, character = col}})
    end
    vim.api.nvim_create_user_command("CljLspCursorInfo", _35_, {nargs = 0})
    local function _37_()
      return vim.lsp.buf_notify(0, "clojure/serverInfo/log")
    end
    vim.api.nvim_create_user_command("CljLspServerInfo", _37_, {nargs = 0})
    local function _38_()
      return vim.lsp.buf_request_sync(0, "clojure/workspace/projectTree/nodes")
    end
    vim.api.nvim_create_user_command("CljLspProjectTree", _38_, {nargs = 0})
    return nil
  else
    return vim.notify(errors_29_[1], vim.log.levels.ERROR)
  end
end
vim.lsp.config("clojure-lsp", {cmd = {"clojure-lsp"}, filetypes = {"clojure"}, root_markers = {"project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", "bb.edn", ".git"}, init_options = {["log-path"] = "/tmp/clojure-lsp.out"}, trace = "verbose"})
vim.lsp.enable("clojure-lsp")
if vim.uv.fs_stat(clojure_lsp_commands) then
  local commands = edn.decode(vim.fn.readblob(clojure_lsp_commands))
  register_keymaps(commands)
  register_commands(commands)
else
end
return nil
