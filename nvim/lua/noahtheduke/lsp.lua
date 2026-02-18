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
    _G.error("Missing argument name on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:13", 2)
  else
  end
  return vim.lsp.get_clients({name = name})[1]
end
local function execute_positional_command(cmd, args)
  local client = get_client("clojure-lsp")
  local _let_3_ = get_uri_and_pos()
  local uri = _let_3_[1]
  local row = _let_3_[2]
  local col = _let_3_[3]
  local function _4_()
    if ("string" == type(args)) then
      return args
    else
      return unpack((args or {}))
    end
  end
  client:exec_cmd({command = cmd.command, arguments = {uri, row, col, _4_()}})
  return vim.api.nvim__redraw({buf = 0, flush = true})
end
local function execute_prompt_command(cmd, args)
  local prompt = cmd.prompt
  if not args then
    local function _5_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.input({prompt = (prompt .. " ")}, _5_)
  else
    local function _7_()
      local t_6_ = args
      if (nil ~= t_6_) then
        t_6_ = t_6_.args
      else
      end
      return t_6_
    end
    return execute_positional_command(cmd, _7_())
  end
end
local function execute_choice_command(cmd, args)
  local prompt = cmd.prompt
  local choices = cmd.choices
  if not args then
    local function _10_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.select(choices, {prompt = prompt}, _10_)
  else
    local function _12_()
      local t_11_ = args
      if (nil ~= t_11_) then
        t_11_ = t_11_.args
      else
      end
      return t_11_
    end
    return execute_positional_command(cmd, _12_())
  end
end
local function get_command_fn(cmd)
  if (nil == cmd) then
    _G.error("Missing argument cmd on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:37", 2)
  else
  end
  local case_16_ = cmd.type
  if (case_16_ == "positional") then
    local function _17_(_args)
      return execute_positional_command(cmd, nil)
    end
    return _17_
  elseif (case_16_ == "prompt") then
    local function _18_(args)
      return execute_prompt_command(cmd, args)
    end
    return _18_
  elseif (case_16_ == "choice") then
    local function _19_(args)
      return execute_choice_command(cmd, args)
    end
    return _19_
  else
    return nil
  end
end
local function register_keymaps(commands)
  if (nil == commands) then
    _G.error("Missing argument commands on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:43", 2)
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
    _G.error("Missing argument commands on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:52", 2)
  else
  end
  local errors_24_ = {}
  local _25_, textcase
  local function _26_()
    return require("textcase")
  end
  local function _27_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:53", 2)
    else
    end
    return table.insert(errors_24_, debug.traceback(err_2_auto))
  end
  _25_, textcase = xpcall(_26_, _27_)
  if _25_ then
    for _, cmd in ipairs(commands) do
      local nargs
      if cmd.positional then
        nargs = "0"
      else
        nargs = "?"
      end
      vim.api.nvim_create_user_command(("CljLsp" .. textcase.api.to_pascal_case(cmd.command)), get_command_fn(cmd), {nargs = nargs})
    end
    local function _30_()
      local _let_31_ = get_uri_and_pos()
      local uri = _let_31_[1]
      local row = _let_31_[2]
      local col = _let_31_[3]
      return vim.lsp.buf_notify(0, "clojure/cursorInfo/log", {textDocument = {uri = uri}, position = {line = row, character = col}})
    end
    vim.api.nvim_create_user_command("CljLspCursorInfo", _30_, {nargs = 0})
    local function _32_()
      return vim.lsp.buf_notify(0, "clojure/serverInfo/log")
    end
    vim.api.nvim_create_user_command("CljLspServerInfo", _32_, {nargs = 0})
    local function _33_()
      return vim.lsp.buf_request_sync(0, "clojure/workspace/projectTree/nodes")
    end
    vim.api.nvim_create_user_command("CljLspProjectTree", _33_, {nargs = 0})
    return nil
  else
    return vim.notify(errors_24_[1], vim.log.levels.ERROR)
  end
end
for _, name in ipairs({"Format", "FOrmat"}) do
  vim.api.nvim_create_user_command(name, vim.lsp.buf.format, {nargs = 0})
end
local function _35_()
  return vim.lsp.buf.code_action({context = {only = {"source.organizeImports"}}, apply = true})
end
vim.api.nvim_create_user_command("OR", _35_, {nargs = 0})
vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\129\151", [vim.diagnostic.severity.WARN] = "\239\129\177", [vim.diagnostic.severity.INFO] = "\239\129\154", [vim.diagnostic.severity.HINT] = "\239\129\153"}}})
local function _36_()
  return vim.lsp.buf.hover({border = "rounded"})
end
vim.keymap.set("n", "K", _36_, utils["ks-opts"]("show docs"))
local function _37_()
  return vim.lsp.buf.signature_help({border = "rounded"})
end
vim.keymap.set("i", "<C-o>", _37_, utils["ks-opts"]("show signature help"))
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
local function _41_(_args)
  do
    vim.diagnostic.open_float({header = "", scope = "cursor", focus = false})
  end
  return nil
end
vim.api.nvim_create_autocmd({"CursorHold"}, {group = vim.api.nvim_create_augroup("lspCursorHold", {clear = true}), pattern = "*", callback = _41_})
local function _42_(args)
  if (nil == args) then
    _G.error("Missing argument args on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:145", 2)
  else
  end
  do
    vim.lsp.document_color.enable(false, args.buf)
  end
  return nil
end
vim.api.nvim_create_autocmd({"LspAttach"}, {callback = _42_})
return nil
