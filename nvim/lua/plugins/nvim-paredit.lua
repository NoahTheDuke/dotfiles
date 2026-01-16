-- [nfnl] nvim/fnl/plugins/nvim-paredit.fnl
local utils = require("utils")
local function config()
  local _1_, paredit = pcall(require, "nvim-paredit")
  local _2_, ts_context = pcall(require, "nvim-paredit.treesitter.context")
  local _3_, ts_forms = pcall(require, "nvim-paredit.treesitter.forms")
  local _4_, ts_utils = pcall(require, "nvim-paredit.treesitter.utils")
  local _5_, whitespace = pcall(require, "nvim-paredit.api.whitespace")
  if (_1_ and _2_ and _3_ and _4_ and _5_) then
    local function insert_in_list(placement)
      local function _6_()
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
      return _6_
    end
    local function enclosing_wrapper_maker(brackets, placement)
      local function _12_()
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
      return _12_
    end
    local function wrapper_maker(brackets, placement)
      local function _16_()
        return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor(unpack(brackets)), {placement = placement, mode = "insert"})
      end
      return _16_
    end
    return paredit.setup({use_default_keys = true, filetypes = {"clojure", "scheme", "lisp", "fennel", "basilisp"}, cursor_behaviour = "follow", keys = {["<localleader>i"] = {enclosing_wrapper_maker({"( ", ")"}, "inner_start"), "Wrap form round insert head"}, ["<localleader>I"] = {enclosing_wrapper_maker({"(", " )"}, "inner_end"), "Wrap form round insert tail"}, ["<localleader>["] = {enclosing_wrapper_maker({"[", "]"}, "inner_start"), "Wrap form square insert head"}, ["<localleader>]"] = {enclosing_wrapper_maker({"[", "]"}, "inner_end"), "Wrap form square insert tail"}, ["<localleader>{"] = {enclosing_wrapper_maker({"{", "}"}, "inner_start"), "Wrap form curly insert head"}, ["<localleader>}"] = {enclosing_wrapper_maker({"{", "}"}, "inner_end"), "Wrap form curly insert tail"}, ["<localleader>w"] = {wrapper_maker({"(", ")"}, "inner_start"), "Wrap element with (), insert head"}, ["<localleader>W"] = {wrapper_maker({"(", ")"}, "inner_end"), "Wrap element with (), insert tail"}, ["<localleader>e["] = {wrapper_maker({"[", "]"}, "inner_start"), "Wrap element with [], insert head"}, ["<localleader>e]"] = {wrapper_maker({"[", "]"}, "inner_end"), "Wrap element with [], insert tail"}, ["<localleader>e{"] = {wrapper_maker({"{", "}"}, "inner_start"), "Wrap element with {}, insert head"}, ["<localleader>e}"] = {wrapper_maker({"{", "}"}, "inner_end"), "Wrap element with {}, insert tail"}, ["<localleader>h"] = {insert_in_list("inner_start"), "Enter insert mode at head of current form"}, ["<localleader>l"] = {insert_in_list("inner_end"), "Enter insert mode at tail of current form"}}})
  else
    return nil
  end
end
--[[ (config) ]]
return {utils.dep("https://github.com/julienvincent/nvim-paredit.git", {config = config})}
