-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function conjure()
  local core = require("nfnl.core")
  local eval = require("conjure.eval")
  local extract = require("conjure.extract")
  local log = require("conjure.log")
  local parse = require("conjure.client.clojure.nrepl.parse")
  local server = require("conjure.client.clojure.nrepl.server")
  local str = require("nfnl.string")
  local ui = require("conjure.client.clojure.nrepl.ui")
  local function time_current_form(extra_opts)
    local form = extract.form({})
    if form then
      local _let_1_ = form
      local content = _let_1_["content"]
      local range = _let_1_["range"]
      eval["eval-str"](core.merge({code = str.join({"(time (dotimes [_ 1000] ", content, "))"}), range = range, origin = "current-form"}, extra_opts))
      return form
    else
      return nil
    end
  end
  local function _3_()
    return time_current_form({})
  end
  vim.keymap.set("n", "<leader>et", _3_)
  local function ns_unmap(extra_opts)
    local form = extract.form({["root?"] = true})
    if form then
      local _let_4_ = form
      local content = _let_4_["content"]
      local range = _let_4_["range"]
      local var_name = core.second(str.split(parse["strip-meta"](content), "%s+"))
      local current_ns = extract.context()
      if var_name then
        log.append({core.str("; Unmapping ", var_name)}, {["break?"] = true})
        local function _5_(_241)
          return ui["display-result"](_241, {["simple-out?"] = true, ["raw-out?"] = true, ["ignore-nil?"] = false})
        end
        server.eval({code = core.str("(ns-unmap (the-ns '", current_ns, ") '", var_name, ")")}, _5_)
      else
      end
      return form
    else
      return nil
    end
  end
  vim.api.nvim_create_user_command("Unmap", ns_unmap, {})
  vim.g["conjure#extract#tree_sitter#enabled"] = true
  vim.g["conjure#log#hud#ignore_low_priority"] = true
  vim.g["conjure#log#wrap"] = true
  vim.g["conjure#mapping#def_word"] = false
  vim.g["conjure#mapping#doc_word"] = false
  vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
  vim.g["conjure#client#clojure#nrepl#test#raw_out"] = false
  vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = {"deftest", "defexpect", "describe"}
  vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
  local runners = require("conjure.client.clojure.nrepl.action")
  runners["test-runners"].lazytest = {namespace = "lazytest.repl", ["all-fn"] = "run-all-tests", ["ns-fn"] = "run-tests", ["single-fn"] = "run-test-var", ["default-call-suffix"] = "{:reporter [lazytest.reporters/nested]}", ["name-prefix"] = "(resolve '", ["name-suffix"] = ")"}
  vim.g["conjure#client#clojure#nrepl#test#call_suffix"] = ""
  vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojure"
  vim.g["conjure#client#clojure#nrepl#test#call_suffix"] = ""
  vim.g["conjure#client#clojure#nrepl#test#runner"] = "lazytest"
  return nil
end
--[[ (conjure) ]]
return {utils.dep("https://github.com/Olical/conjure.git", {config = conjure})}
