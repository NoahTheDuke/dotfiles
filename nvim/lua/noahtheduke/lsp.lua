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
local function register_keymaps(commands)
  if (nil == commands) then
    _G.error("Missing argument commands on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:16", 2)
  else
  end
  for _, v in ipairs(commands) do
    if v.shortcut then
      local function _4_()
        local client = get_client("clojure-lsp")
        if client then
          client:exec_cmd({command = v.command, arguments = get_uri_and_pos()})
          return vim.api.nvim__redraw({buf = 0, flush = true})
        else
          return nil
        end
      end
      vim.keymap.set("n", ("<leader>cl" .. v.shortcut), _4_, {silent = true, noremap = true, desc = ("clojure-lsp-" .. v.command)})
    else
    end
  end
  return nil
end
local function execute_positional_command(cmd, ...)
  if (nil == cmd) then
    _G.error("Missing argument cmd on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:30", 2)
  else
  end
  local client = get_client("clojure-lsp")
  local _let_8_ = get_uri_and_pos()
  local uri = _let_8_[1]
  local row = _let_8_[2]
  local col = _let_8_[3]
  return client:exec_cmd({command = cmd.command, arguments = {uri, row, col, ...}})
end
local function execute_prompt_command(cmd, args)
  if (nil == args) then
    _G.error("Missing argument args on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:36", 2)
  else
  end
  if (nil == cmd) then
    _G.error("Missing argument cmd on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:36", 2)
  else
  end
  local prompt = cmd.prompt
  if ("" == args.args) then
    local function _11_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.input({prompt = prompt}, _11_)
  else
    return execute_positional_command(cmd, args.args)
  end
end
local function execute_choice_command(cmd, args)
  if (nil == args) then
    _G.error("Missing argument args on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:42", 2)
  else
  end
  if (nil == cmd) then
    _G.error("Missing argument cmd on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:42", 2)
  else
  end
  local prompt = cmd.prompt
  local choices = cmd.choices
  if ("" == args.args) then
    local function _15_(choice)
      if (nil == choice) then
        _G.error("Missing argument choice on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:45", 2)
      else
      end
      if (choice ~= nil) then
        return execute_positional_command(cmd, choice)
      else
        return execute_positional_command(cmd)
      end
    end
    return vim.ui.select(choices, {prompt = prompt}, _15_)
  else
    return execute_positional_command(cmd, args.args)
  end
end
local function register_commands(commands)
  if (nil == commands) then
    _G.error("Missing argument commands on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:51", 2)
  else
  end
  local errors_20_ = {}
  local _21_, textcase
  local function _22_()
    return require("textcase")
  end
  local function _23_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:52", 2)
    else
    end
    return table.insert(errors_20_, debug.traceback(err_2_auto))
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
      local cmd_type = cmd.type
      local _26_
      if (cmd_type == "positional") then
        local function _28_(_args)
          return execute_positional_command(cmd)
        end
        _26_ = _28_
      elseif (cmd_type == "prompt") then
        local function _30_(args)
          if (nil == args) then
            _G.error("Missing argument args on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:60", 2)
          else
          end
          return execute_prompt_command(cmd, args)
        end
        _26_ = _30_
      elseif (cmd_type == "choice") then
        local function _33_(args)
          if (nil == args) then
            _G.error("Missing argument args on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:61", 2)
          else
          end
          return execute_choice_command(cmd, args)
        end
        _26_ = _33_
      else
        _26_ = nil
      end
      vim.api.nvim_create_user_command(("CljLsp" .. textcase.api.to_pascal_case(cmd.command)), _26_, {nargs = nargs})
    end
    local function _36_()
      local _let_37_ = get_uri_and_pos()
      local uri = _let_37_[1]
      local row = _let_37_[2]
      local col = _let_37_[3]
      return vim.lsp.buf_notify(0, "clojure/cursorInfo/log", {textDocument = {uri = uri}, position = {line = row, character = col}})
    end
    vim.api.nvim_create_user_command("CljLspCursorInfo", _36_, {nargs = 0})
    local function _38_()
      return vim.lsp.buf_notify(0, "clojure/serverInfo/log")
    end
    vim.api.nvim_create_user_command("CljLspServerInfo", _38_, {nargs = 0})
    local function _39_()
      return vim.lsp.buf_request_sync(0, "clojure/workspace/projectTree/nodes")
    end
    vim.api.nvim_create_user_command("CljLspProjectTree", _39_, {nargs = 0})
    return nil
  else
    return vim.notify(errors_20_[1], vim.log.levels.ERROR)
  end
end
for _, name in ipairs({"Format", "FOrmat"}) do
  local function _41_()
    return vim.lsp.buf.format()
  end
  vim.api.nvim_create_user_command(name, _41_, {nargs = 0})
end
local function _42_()
  return vim.lsp.buf.code_action({context = {only = {"source.organizeImports"}}, apply = true})
end
vim.api.nvim_create_user_command("OR", _42_, {nargs = 0})
vim.diagnostic.config({signs = {text = {[vim.diagnostic.severity.ERROR] = "\239\129\151", [vim.diagnostic.severity.WARN] = "\239\129\177", [vim.diagnostic.severity.INFO] = "\239\129\154", [vim.diagnostic.severity.HINT] = "\239\129\153"}}})
local function _43_()
  return vim.lsp.buf.hover({border = "rounded"})
end
vim.keymap.set("n", "K", _43_, utils["ks-opts"]("show docs"))
local function _44_()
  return vim.lsp.buf.signature_help({border = "rounded"})
end
vim.keymap.set("i", "<C-o>", _44_, utils["ks-opts"]("show signature help"))
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
local function _48_(_args)
  do
    vim.diagnostic.open_float({header = "", scope = "cursor", focus = false})
  end
  return nil
end
vim.api.nvim_create_autocmd({"CursorHold"}, {group = vim.api.nvim_create_augroup("lspCursorHold", {clear = true}), pattern = "*", callback = _48_})
local function _49_(args)
  if (nil == args) then
    _G.error("Missing argument args on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/lsp.fnl:149", 2)
  else
  end
  do
    vim.lsp.document_color.enable(false, args.buf)
  end
  return nil
end
vim.api.nvim_create_autocmd({"LspAttach"}, {callback = _49_})
return nil
