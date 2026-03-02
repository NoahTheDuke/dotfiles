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
  return vim.lsp.get_clients({name = name})[1]
end
local function execute_positional_command(cmd, args)
  local client = get_client("clojure-lsp")
  local _let_2_ = get_uri_and_pos()
  local uri = _let_2_[1]
  local row = _let_2_[2]
  local col = _let_2_[3]
  local function _3_()
    if ("string" == type(args)) then
      return args
    else
      return unpack((args or {}))
    end
  end
  client:exec_cmd({command = cmd.command, arguments = {uri, row, col, _3_()}})
  return vim.api.nvim__redraw({buf = 0, flush = true})
end
local function execute_prompt_command(cmd, args)
  local prompt = cmd.prompt
  if not args then
    local function _4_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.input({prompt = (prompt .. " ")}, _4_)
  else
    local function _6_()
      local t_5_ = args
      if (nil ~= t_5_) then
        t_5_ = t_5_.args
      else
      end
      return t_5_
    end
    return execute_positional_command(cmd, _6_())
  end
end
local function execute_choice_command(cmd, args)
  local prompt = cmd.prompt
  local choices = cmd.choices
  if not args then
    local function _9_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.select(choices, {prompt = prompt}, _9_)
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
local function get_command_fn(cmd)
  local case_14_ = cmd.type
  if (case_14_ == "positional") then
    local function _15_(_args)
      return execute_positional_command(cmd, nil)
    end
    return _15_
  elseif (case_14_ == "prompt") then
    local function _16_(args)
      return execute_prompt_command(cmd, args)
    end
    return _16_
  elseif (case_14_ == "choice") then
    local function _17_(args)
      return execute_choice_command(cmd, args)
    end
    return _17_
  else
    return nil
  end
end
local function register_keymaps(commands)
  for _, cmd in ipairs(commands) do
    if cmd.shortcut then
      vim.keymap.set("n", ("<leader>cl" .. cmd.shortcut), get_command_fn(cmd), {silent = true, noremap = true, desc = ("clojure-lsp-" .. cmd.command)})
    else
    end
  end
  return nil
end
local function register_commands(commands)
  local errors_20_ = {}
  local _21_, textcase
  local function _22_()
    return require("textcase")
  end
  local function _23_(err_1_auto)
    return table.insert(errors_20_, debug.traceback(err_1_auto))
  end
  _21_, textcase = xpcall(_22_, _23_)
  if _21_ then
    for _, cmd in ipairs(commands) do
      local nargs
      if cmd.positional then
        nargs = "0"
      else
        nargs = "?"
      end
      vim.api.nvim_create_user_command(("CljLsp" .. textcase.api.to_pascal_case(cmd.command)), get_command_fn(cmd), {nargs = nargs})
    end
    local function _25_()
      local _let_26_ = get_uri_and_pos()
      local uri = _let_26_[1]
      local row = _let_26_[2]
      local col = _let_26_[3]
      return vim.lsp.buf_notify(0, "clojure/cursorInfo/log", {textDocument = {uri = uri}, position = {line = row, character = col}})
    end
    vim.api.nvim_create_user_command("CljLspCursorInfo", _25_, {nargs = 0})
    local function _27_()
      return vim.lsp.buf_notify(0, "clojure/serverInfo/log")
    end
    vim.api.nvim_create_user_command("CljLspServerInfo", _27_, {nargs = 0})
    local function _28_()
      return vim.lsp.buf_request_sync(0, "clojure/workspace/projectTree/nodes")
    end
    vim.api.nvim_create_user_command("CljLspProjectTree", _28_, {nargs = 0})
    return nil
  else
    return vim.notify(errors_20_[1], vim.log.levels.ERROR)
  end
end
for _, name in ipairs({"Format", "FOrmat"}) do
  vim.api.nvim_create_user_command(name, vim.lsp.buf.format, {nargs = 0})
end
local function _30_()
  return vim.lsp.buf.code_action({context = {only = {"source.organizeImports"}}, apply = true})
end
vim.api.nvim_create_user_command("OR", _30_, {nargs = 0})
vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\129\151", [vim.diagnostic.severity.WARN] = "\239\129\177", [vim.diagnostic.severity.INFO] = "\239\129\154", [vim.diagnostic.severity.HINT] = "\239\129\153"}}})
local function _31_()
  return vim.lsp.buf.hover({border = "rounded"})
end
vim.keymap.set("n", "K", _31_, utils["ks-opts"]("show docs"))
local function _32_()
  return vim.lsp.buf.signature_help({border = "rounded"})
end
vim.keymap.set("i", "<C-o>", _32_, utils["ks-opts"]("show signature help"))
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
local function _36_(_args)
  do
    vim.diagnostic.open_float({header = "", scope = "cursor", focus = false})
  end
  return nil
end
vim.api.nvim_create_autocmd({"CursorHold"}, {group = vim.api.nvim_create_augroup("lspCursorHold", {clear = true}), pattern = "*", callback = _36_})
local function _37_(args)
  do
    vim.lsp.document_color.enable(false, args.buf)
  end
  return nil
end
vim.api.nvim_create_autocmd({"LspAttach"}, {callback = _37_})
return nil
