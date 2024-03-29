-- [nfnl] Compiled from fnl/plugins/conjure.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function conjure()
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
  runners["test-runners"].lazytest = {namespace = "lazytest.runner.repl", ["all-fn"] = "run-all-tests", ["ns-fn"] = "run-tests", ["single-fn"] = "run-test-var", ["default-call-suffix"] = "", ["name-prefix"] = "(resolve '", ["name-suffix"] = ")"}
  vim.g["conjure#client#clojure#nrepl#test#call_suffix"] = "{:kaocha/color? false :capture-output? false}"
  vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
  return nil
end
--[[ (conjure) ]]
return {utils.dep("https://github.com/Olical/conjure", {config = conjure})}
