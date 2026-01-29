-- [nfnl] nvim/fnl/plugins/nvim-lspconfig.fnl
local utils = require("utils")
local edn = require("edn")
local keyset = vim.keymap.set
local clojure_lsp_commands = (vim.fn.stdpath("config") .. "/data/clojure-lsp-commands.edn")
local function get_uri_and_pos()
  local _let_1_ = vim.api.nvim_win_get_cursor(0)
  local row = _let_1_[1]
  local col = _let_1_[2]
  local uri = vim.uri_from_bufnr(0)
  return {uri, (row - 1), col}
end
local function get_client(name)
  return vim.lsp.get_clients({name = "clojure-lsp"})[1]
end
local function register_keymaps(commands)
  for _, v in ipairs(commands) do
    if v.shortcut then
      local function _2_()
        local client = get_client("clojure-lsp")
        if client then
          client:exec_cmd({command = v.command, arguments = get_uri_and_pos()})
          return vim.api.nvim__redraw({buf = 0, flush = true})
        else
          return nil
        end
      end
      keyset("n", ("<leader>cl" .. v.shortcut), _2_, {silent = true, noremap = true, desc = ("clojure-lsp-" .. v.command)})
    else
    end
  end
  return nil
end
local function execute_positional_command(cmd, ...)
  local client = get_client("clojure-lsp")
  local _let_5_ = get_uri_and_pos()
  local uri = _let_5_[1]
  local row = _let_5_[2]
  local col = _let_5_[3]
  return client:exec_cmd({command = cmd.command, arguments = {uri, row, col, ...}})
end
local function execute_prompt_command(cmd, args)
  local prompt = cmd.prompt
  if ("" == args.args) then
    local function _6_(_241)
      return execute_positional_command(cmd, _241)
    end
    return vim.ui.input({prompt = prompt}, _6_)
  else
    return execute_positional_command(cmd, args.args)
  end
end
local function execute_choice_command(cmd, args)
  local prompt = cmd.prompt
  local choices = cmd.choices
  if ("" == args.args) then
    local function _8_(choice)
      if (choice ~= nil) then
        return execute_positional_command(cmd, choice)
      else
        return execute_positional_command(cmd)
      end
    end
    return vim.ui.select(choices, {prompt = prompt}, _8_)
  else
    return execute_positional_command(cmd, args.args)
  end
end
local function register_commands(commands)
  local _11_, textcase = pcall(require, "textcase")
  if _11_ then
    for _, cmd in ipairs(commands) do
      local nargs
      if cmd.positional then
        nargs = "0"
      else
        nargs = "?"
      end
      local cmd_type = cmd.type
      local _13_
      if (cmd_type == "positional") then
        local function _15_()
          return execute_positional_command(cmd)
        end
        _13_ = _15_
      elseif (cmd_type == "prompt") then
        local function _17_(args)
          return execute_prompt_command(cmd, args)
        end
        _13_ = _17_
      elseif (cmd_type == "choice") then
        local function _19_(args)
          return execute_choice_command(cmd, args)
        end
        _13_ = _19_
      else
        _13_ = nil
      end
      vim.api.nvim_create_user_command(textcase.api.to_pascal_case(("CljLsp" .. cmd.command)), _13_, {nargs = nargs})
    end
    local function _21_()
      local _let_22_ = get_uri_and_pos()
      local uri = _let_22_[1]
      local row = _let_22_[2]
      local col = _let_22_[3]
      return vim.lsp.buf_notify(0, "clojure/cursorInfo/log", {textDocument = {uri = uri}, position = {line = row, character = col}})
    end
    vim.api.nvim_create_user_command("CljLspCursorInfo", _21_, {nargs = 0})
    local function _23_()
      return vim.lsp.buf_notify(0, "clojure/serverInfo/log")
    end
    vim.api.nvim_create_user_command("CljLspServerInfo", _23_, {nargs = 0})
    local function _24_()
      return vim.lsp.buf_request_sync(0, "clojure/workspace/projectTree/nodes")
    end
    return vim.api.nvim_create_user_command("CljLspProjectTree", _24_, {nargs = 0})
  else
    return nil
  end
end
local clojure_lsp_config = {cmd = {"clojure-lsp"}, filetypes = {"clojure"}, root_markers = {"project.clj", "deps.edn", "build.boot", "shadow-cljs.edn", "bb.edn", ".git"}, init_options = {["log-path"] = "/tmp/clojure-lsp.out"}, trace = "verbose"}
local function clojure_lsp()
  vim.lsp.config("clojure-lsp", clojure_lsp_config)
  vim.lsp.enable("clojure-lsp")
  if vim.uv.fs_stat(clojure_lsp_commands) then
    local commands = edn.decode(vim.fn.readblob(clojure_lsp_commands))
    register_keymaps(commands)
    return register_commands(commands)
  else
    return nil
  end
end
local lsp_configs = {"fennel_ls", "lua_ls", "ocamllsp", "racket_langserver", "rust_analyzer", "terraformls", "ts_ls"}
local function config()
  for _, name in ipairs({"Format", "FOrmat"}) do
    local function _27_()
      return vim.lsp.buf.format()
    end
    vim.api.nvim_create_user_command(name, _27_, {nargs = 0})
  end
  local function _28_()
    return vim.lsp.buf.code_action({context = {only = {"source.organizeImports"}}, apply = true})
  end
  vim.api.nvim_create_user_command("OR", _28_, {nargs = 0})
  clojure_lsp()
  for _, language in ipairs(lsp_configs) do
    vim.lsp.enable(language)
  end
  return nil
end
return {utils.dep("https://github.com/neovim/nvim-lspconfig", {dependencies = {"https://github.com/johmsalas/text-case.nvim"}, config = config})}
