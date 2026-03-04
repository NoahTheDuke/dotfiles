-- [nfnl] fnl/noahtheduke/lsp.fnl
local utils = require("noahtheduke.utils")
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
    _G.error("Missing argument name on fnl/noahtheduke/lsp.fnl:13", 2)
  else
  end
  return vim.lsp.get_clients({name = name})[1]
end
local function execute_positional_command(cmd, args)
  if (nil == args) then
    _G.error("Missing argument args on fnl/noahtheduke/lsp.fnl:16", 2)
  else
  end
  if (nil == cmd) then
    _G.error("Missing argument cmd on fnl/noahtheduke/lsp.fnl:16", 2)
  else
  end
  local client = get_client("clojure-lsp")
  local _let_5_ = get_uri_and_pos()
  local uri = _let_5_[1]
  local row = _let_5_[2]
  local col = _let_5_[3]
  local function _6_()
    if ("string" == type(args)) then
      return args
    else
      return unpack((args or {}))
    end
  end
  client:exec_cmd({command = cmd.command, arguments = {uri, row, col, _6_()}})
  return vim.api.nvim__redraw({buf = 0, flush = true})
end
local function execute_prompt_command(cmd, args)
  if (nil == args) then
    _G.error("Missing argument args on fnl/noahtheduke/lsp.fnl:25", 2)
  else
  end
  if (nil == cmd) then
    _G.error("Missing argument cmd on fnl/noahtheduke/lsp.fnl:25", 2)
  else
  end
  local prompt = cmd.prompt
  if not args then
    local function _9_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.input({prompt = (prompt .. " ")}, _9_)
  else
    local function _11_()
      local t_10_ = args
      if (nil ~= t_10_) then
        t_10_ = t_10_.args
      else
      end
      return t_10_
    end
    return execute_positional_command(cmd, _11_())
  end
end
local function execute_choice_command(cmd, args)
  if (nil == args) then
    _G.error("Missing argument args on fnl/noahtheduke/lsp.fnl:31", 2)
  else
  end
  if (nil == cmd) then
    _G.error("Missing argument cmd on fnl/noahtheduke/lsp.fnl:31", 2)
  else
  end
  local prompt = cmd.prompt
  local choices = cmd.choices
  if not args then
    local function _16_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.select(choices, {prompt = prompt}, _16_)
  else
    local function _18_()
      local t_17_ = args
      if (nil ~= t_17_) then
        t_17_ = t_17_.args
      else
      end
      return t_17_
    end
    return execute_positional_command(cmd, _18_())
  end
end
local function get_command_fn(cmd)
  if (nil == cmd) then
    _G.error("Missing argument cmd on fnl/noahtheduke/lsp.fnl:37", 2)
  else
  end
  local case_22_ = cmd.type
  if (case_22_ == "positional") then
    local function _23_(_args)
      return execute_positional_command(cmd, nil)
    end
    return _23_
  elseif (case_22_ == "prompt") then
    local function _24_(args)
      if (nil == args) then
        _G.error("Missing argument args on fnl/noahtheduke/lsp.fnl:40", 2)
      else
      end
      return execute_prompt_command(cmd, args)
    end
    return _24_
  elseif (case_22_ == "choice") then
    local function _26_(args)
      if (nil == args) then
        _G.error("Missing argument args on fnl/noahtheduke/lsp.fnl:41", 2)
      else
      end
      return execute_choice_command(cmd, args)
    end
    return _26_
  else
    return nil
  end
end
local function register_keymaps(commands)
  if (nil == commands) then
    _G.error("Missing argument commands on fnl/noahtheduke/lsp.fnl:43", 2)
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
    _G.error("Missing argument commands on fnl/noahtheduke/lsp.fnl:52", 2)
  else
  end
  local errors_32_ = {}
  local _33_, textcase
  local function _34_()
    return require("textcase")
  end
  local function _35_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/lsp.fnl:53", 2)
    else
    end
    return table.insert(errors_32_, debug.traceback(err_2_auto))
  end
  _33_, textcase = xpcall(_34_, _35_)
  if _33_ then
    for _, cmd in ipairs(commands) do
      local nargs
      if cmd.positional then
        nargs = "0"
      else
        nargs = "?"
      end
      vim.api.nvim_create_user_command(("CljLsp" .. textcase.api.to_pascal_case(cmd.command)), get_command_fn(cmd), {nargs = nargs})
    end
    local function _38_()
      local _let_39_ = get_uri_and_pos()
      local uri = _let_39_[1]
      local row = _let_39_[2]
      local col = _let_39_[3]
      return vim.lsp.buf_notify(0, "clojure/cursorInfo/log", {textDocument = {uri = uri}, position = {line = row, character = col}})
    end
    vim.api.nvim_create_user_command("CljLspCursorInfo", _38_, {nargs = 0})
    local function _40_()
      return vim.lsp.buf_notify(0, "clojure/serverInfo/log")
    end
    vim.api.nvim_create_user_command("CljLspServerInfo", _40_, {nargs = 0})
    local function _41_()
      return vim.lsp.buf_request_sync(0, "clojure/workspace/projectTree/nodes")
    end
    vim.api.nvim_create_user_command("CljLspProjectTree", _41_, {nargs = 0})
    return nil
  else
    return vim.notify(errors_32_[1], vim.log.levels.ERROR)
  end
end
for _, name in ipairs({"Format", "FOrmat"}) do
  local function _43_()
    return vim.lsp.buf.format()
  end
  vim.api.nvim_create_user_command(name, _43_, {nargs = 0})
end
local function _44_()
  return vim.lsp.buf.code_action({context = {only = {"source.organizeImports"}}, apply = true})
end
vim.api.nvim_create_user_command("OR", _44_, {nargs = 0})
vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\129\151", [vim.diagnostic.severity.WARN] = "\239\129\177", [vim.diagnostic.severity.INFO] = "\239\129\154", [vim.diagnostic.severity.HINT] = "\239\129\153"}}})
local function _45_()
  return vim.lsp.buf.hover({border = "rounded"})
end
vim.keymap.set("n", "K", _45_, utils["ks-opts"]("show docs"))
local function _46_()
  return vim.lsp.buf.signature_help({border = "rounded"})
end
vim.keymap.set("i", "<C-o>", _46_, utils["ks-opts"]("show signature help"))
local function show_docs()
  do
    local cw = vim.fn.expand("<cword>")
    if (0 <= vim.fn.index({"vim", "help"}, vim.bo.filetype)) then
      vim.api.nvim_command(("h " .. cw))
    elseif (0 < #vim.lsp.get_clients({bufnr = 0})) then
      vim.lsp.buf.definition()
    else
      vim.api.nvim_command(("!" .. vim.o.keywordprg .. " " .. cw))
    end
  end
  return nil
end
vim.keymap.set("n", "gd", show_docs, utils["ks-opts"]("go to definition"))
vim.lsp.config("clojure-lsp", {cmd = {"clojure-lsp"}, filetypes = {"clojure"}, root_markers = {"project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", "bb.edn", ".git"}, init_options = {["log-path"] = "/tmp/clojure-lsp.out"}, trace = "verbose"})
vim.lsp.enable("clojure-lsp")
if vim.uv.fs_stat(clojure_lsp_commands) then
  local commands = edn.decode(vim.fn.readblob(clojure_lsp_commands))
  register_keymaps(commands)
  register_commands(commands)
else
end
if (1 == vim.fn.has("nvim-0.12.0")) then
  vim.lsp.semantic_tokens.enable(false)
else
end
local function _50_(_args)
  do
    vim.diagnostic.open_float({header = "", scope = "cursor", focus = false})
  end
  return nil
end
vim.api.nvim_create_autocmd({"CursorHold"}, {group = vim.api.nvim_create_augroup("lspCursorHold", {clear = true}), pattern = "*", callback = _50_})
local function _51_(args)
  if (nil == args) then
    _G.error("Missing argument args on fnl/noahtheduke/lsp.fnl:145", 2)
  else
  end
  do
    vim.lsp.document_color.enable(false, args.buf)
  end
  return nil
end
vim.api.nvim_create_autocmd({"LspAttach"}, {callback = _51_})
return nil
