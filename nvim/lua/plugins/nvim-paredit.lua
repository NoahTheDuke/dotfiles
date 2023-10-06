local paredit = require("nvim-paredit")
local common = require("nvim-paredit.utils.common")
local langs = require("nvim-paredit.lang")
local ts = require("nvim-treesitter.ts_utils")

local function wrapper_maker(wrapper, brackets, placement)
  return function()
    paredit.cursor.place_cursor(
      paredit.wrap[wrapper](unpack(brackets)),
      { placement = placement, mode = "insert" }
    )
  end
end

local function move_in_list(placement, mode)
  local lang = langs.get_language_api()
  local current_element = paredit.wrap.find_element_under_cursor(lang)

  if not current_element then
    return
  end

  local use_direct_parent = common.is_whitespace_under_cursor(lang)
    or lang.node_is_comment(ts.get_node_at_cursor())

  local form = paredit.wrap.find_form(current_element, lang)
  if not use_direct_parent and form:type() ~= "source" then
    form = paredit.wrap.find_parend_form(current_element, lang)
  end

  return paredit.cursor.place_cursor(
    form,
    { placement = placement, mode = mode }
  )
end

local function insert_in_list_head() move_in_list("inner_start", "insert") end
local function insert_in_list_tail() move_in_list("inner_end", "insert") end
local function move_to_prev_bracket() move_in_list("left_edge", nil) end
local function move_to_next_bracket() move_in_list("inner_end", nil) end

paredit.setup({
  use_default_keys = true,
  filetypes = { "clojure", "scheme", "lisp", "fennel" },
  cursor_behaviour = "follow",
  keys = {
    -- Wrap enclosing form in given type, enter insert mode at start or end
    ["<localleader>i"] = {
      wrapper_maker("wrap_enclosing_form_under_cursor", {"( ", ")"}, "inner_start"),
      "Wrap form round, insert head",
    },

    ["<localleader>I"] = {
      wrapper_maker("wrap_enclosing_form_under_cursor", {"(", " )"}, "inner_end"),
      "Wrap form round, insert tail",
    },

    ["<localleader>["] = {
      wrapper_maker("wrap_enclosing_form_under_cursor", {"[", "]"}, "inner_start"),
      "Wrap form square, insert head",
    },

    ["<localleader>]"] = {
      wrapper_maker("wrap_enclosing_form_under_cursor", {"[", "]"}, "inner_end"),
      "Wrap form square, insert tail",
    },

    ["<localleader>{"] = {
      wrapper_maker("wrap_enclosing_form_under_cursor", {"{", "}"}, "inner_start"),
      "Wrap form curly, insert head",
    },

    ["<localleader>}"] = {
      wrapper_maker("wrap_enclosing_form_under_cursor", {"{", "}"}, "inner_end"),
      "Wrap form curly, insert tail",
    },

    -- Wrap current form in given type, enter insert mode at start or end
    ["<localleader>w"] = {
      wrapper_maker("wrap_element_under_cursor", {"(", ")"}, "inner_start"),
      "Wrap element insert head",
    },

    ["<localleader>W"] = {
      wrapper_maker("wrap_element_under_cursor", {"(", ")"}, "inner_end"),
      "Wrap element insert tail",
    },

    ["<localleader>h"] = { insert_in_list_head, "Enter insert mode at head of current form" },
    ["<localleader>l"] = { insert_in_list_tail, "Enter insert mode at tail of current form" },
    ["("] = { move_to_prev_bracket, "Move to previous enclosing bracket" },
    [")"] = { move_to_next_bracket, "Move to next enclosing bracket" },

  }
})
