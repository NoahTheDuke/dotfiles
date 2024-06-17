-- [nfnl] Compiled from fnl/plugins/nvim-paredit.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function config()
  local paredit = require("nvim-paredit")
  local common = require("nvim-paredit.utils.common")
  local langs = require("nvim-paredit.lang")
  local clj = require("nvim-paredit.lang.clojure")
  local ts = require("nvim-treesitter.ts_utils")
  local function enclosing_wrapper_maker(brackets, placement)
    local function _1_()
      if clj.node_is_form(ts.get_node_at_cursor()) then
        return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor(unpack(brackets)), {placement = placement, mode = "insert"})
      else
        return paredit.cursor.place_cursor(paredit.wrap.wrap_enclosing_form_under_cursor(unpack(brackets)), {placement = placement, mode = "insert"})
      end
    end
    return _1_
  end
  local function wrapper_maker(brackets, placement)
    local function _3_()
      return paredit.cursor.place_cursor(paredit.wrap.wrap_element_under_cursor(unpack(brackets)), {placement = placement, mode = "insert"})
    end
    return _3_
  end
  local function move_in_list(placement, mode)
    local lang = langs.get_language_api()
    local current_element = paredit.wrap.find_element_under_cursor(lang)
    if current_element then
      local use_direct_parent = (common.is_whitespace_under_cursor(lang) or lang.node_is_comment(ts.get_node_at_cursor()))
      local form = paredit.wrap.find_form(current_element, lang)
      if (not use_direct_parent and (form:type() ~= "source")) then
        form = paredit.wrap.find_parend_form(current_element, lang)
      else
      end
      return paredit.cursor.place_cursor(form, {placement = placement, mode = mode})
    else
      return nil
    end
  end
  local function insert_in_list_head()
    return move_in_list("inner_start", "insert")
  end
  local function insert_in_list_tail()
    return move_in_list("inner_end", "insert")
  end
  return paredit.setup({use_default_keys = true, filetypes = {"clojure", "scheme", "lisp", "fennel"}, cursor_behaviour = "follow", keys = {["<localleader>i"] = {enclosing_wrapper_maker({"( ", ")"}, "inner_start"), "Wrap form round insert head"}, ["<localleader>I"] = {enclosing_wrapper_maker({"(", " )"}, "inner_end"), "Wrap form round insert tail"}, ["<localleader>["] = {enclosing_wrapper_maker({"[", "]"}, "inner_start"), "Wrap form square insert head"}, ["<localleader>]"] = {enclosing_wrapper_maker({"[", "]"}, "inner_end"), "Wrap form square insert tail"}, ["<localleader>{"] = {enclosing_wrapper_maker({"{", "}"}, "inner_start"), "Wrap form curly insert head"}, ["<localleader>}"] = {enclosing_wrapper_maker({"{", "}"}, "inner_end"), "Wrap form curly insert tail"}, ["<localleader>w"] = {wrapper_maker({"(", ")"}, "inner_start"), "Wrap element insert head"}, ["<localleader>W"] = {wrapper_maker({"(", ")"}, "inner_end"), "Wrap element insert tail"}, ["<localleader>h"] = {insert_in_list_head, "Enter insert mode at head of current form"}, ["<localleader>l"] = {insert_in_list_tail, "Enter insert mode at tail of current form"}}})
end
--[[ (config) ]]
return {utils.dep("https://github.com/julienvincent/nvim-paredit.git", {config = config})}
