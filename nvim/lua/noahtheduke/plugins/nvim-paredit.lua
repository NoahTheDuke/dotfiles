-- [nfnl] fnl/noahtheduke/plugins/nvim-paredit.fnl
local utils = require("noahtheduke.utils")
local function config()
  local errors_1_ = {}
  local _2_, paredit
  local function _7_()
    return require("nvim-paredit")
  end
  local function _8_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:6", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, paredit = xpcall(_7_, _8_)
  local _3_, ts_context
  local function _10_()
    return require("nvim-paredit.treesitter.context")
  end
  local function _11_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:6", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _3_, ts_context = xpcall(_10_, _11_)
  local _4_, ts_forms
  local function _13_()
    return require("nvim-paredit.treesitter.forms")
  end
  local function _14_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:6", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _4_, ts_forms = xpcall(_13_, _14_)
  local _5_, ts_utils
  local function _16_()
    return require("nvim-paredit.treesitter.utils")
  end
  local function _17_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:6", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _5_, ts_utils = xpcall(_16_, _17_)
  local _6_, whitespace
  local function _19_()
    return require("nvim-paredit.api.whitespace")
  end
  local function _20_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:6", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _6_, whitespace = xpcall(_19_, _20_)
  if (_2_ and _3_ and _4_ and _5_ and _6_) then
    local function insert_in_list(placement)
      if (nil == placement) then
        _G.error("Missing argument placement on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:11", 2)
      else
      end
      local function _23_()
        local context = ts_context.create_context()
        if not context then
          return
        else
        end
        local current_element = ts_forms.get_node_root(context.node, context)
        if not current_element then
          return
        else
        end
        local use_direct_parent = (whitespace.is_whitespace_under_cursor() or ts_utils.node_is_comment(current_element, context))
        local form = ts_forms.find_nearest_form(current_element, {captures = context.captures, ["use-source"] = false})
        if not form then
          return
        else
        end
        if (not use_direct_parent and (form:type() ~= "source")) then
          form = ts_utils.find_local_root(current_element)
          if not (form and ts_forms.node_is_form(form, context)) then
            return
          else
          end
        else
        end
        return paredit.cursor.place_cursor(form, {placement = placement, mode = "insert"})
      end
      return _23_
    end
    local function enclosing_wrapper_maker(brackets, placement)
      if (nil == placement) then
        _G.error("Missing argument placement on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:34", 2)
      else
      end
      if (nil == brackets) then
        _G.error("Missing argument brackets on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:34", 2)
      else
      end
      local function _31_()
        local context = ts_context.create_context()
        if not context then
          return
        else
        end
        local current_element = ts_forms.get_node_root(context.node, context)
        if not current_element then
          return
        else
        end
        if ts_forms.node_is_form(current_element, context) then
          local buf = vim.api.nvim_get_current_buf()
          return paredit.cursor.place_cursor(paredit.wrap.wrap_element(buf, current_element, unpack(brackets)), {placement = placement, mode = "insert"})
        else
          return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor(unpack(brackets)), {placement = placement, mode = "insert"})
        end
      end
      return _31_
    end
    local function wrapper_maker(brackets, placement)
      if (nil == placement) then
        _G.error("Missing argument placement on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:53", 2)
      else
      end
      if (nil == brackets) then
        _G.error("Missing argument brackets on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/nvim-paredit.fnl:53", 2)
      else
      end
      local function _37_()
        return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor(unpack(brackets)), {placement = placement, mode = "insert"})
      end
      return _37_
    end
    return paredit.setup({use_default_keys = true, filetypes = {"clojure", "scheme", "lisp", "fennel", "basilisp"}, cursor_behaviour = "follow", keys = {["<localleader>i"] = {enclosing_wrapper_maker({"( ", ")"}, "inner_start"), "Wrap form round insert head"}, ["<localleader>I"] = {enclosing_wrapper_maker({"(", " )"}, "inner_end"), "Wrap form round insert tail"}, ["<localleader>["] = {enclosing_wrapper_maker({"[", "]"}, "inner_start"), "Wrap form square insert head"}, ["<localleader>]"] = {enclosing_wrapper_maker({"[", "]"}, "inner_end"), "Wrap form square insert tail"}, ["<localleader>{"] = {enclosing_wrapper_maker({"{", "}"}, "inner_start"), "Wrap form curly insert head"}, ["<localleader>}"] = {enclosing_wrapper_maker({"{", "}"}, "inner_end"), "Wrap form curly insert tail"}, ["<localleader>w"] = {wrapper_maker({"(", ")"}, "inner_start"), "Wrap element with (), insert head"}, ["<localleader>W"] = {wrapper_maker({"(", ")"}, "inner_end"), "Wrap element with (), insert tail"}, ["<localleader>e["] = {wrapper_maker({"[", "]"}, "inner_start"), "Wrap element with [], insert head"}, ["<localleader>e]"] = {wrapper_maker({"[", "]"}, "inner_end"), "Wrap element with [], insert tail"}, ["<localleader>e{"] = {wrapper_maker({"{", "}"}, "inner_start"), "Wrap element with {}, insert head"}, ["<localleader>e}"] = {wrapper_maker({"{", "}"}, "inner_end"), "Wrap element with {}, insert tail"}, ["<localleader>h"] = {insert_in_list("inner_start"), "Enter insert mode at head of current form"}, ["<localleader>l"] = {insert_in_list("inner_end"), "Enter insert mode at tail of current form"}}})
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/julienvincent/nvim-paredit.git", {config = config})}
