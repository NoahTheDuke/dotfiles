vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = {"deftest", "defexpect"}
vim.g["conjure#extract#tree_sitter#enabled"] = true
vim.g["conjure#log#hud#ignore_low_priority"] = true
vim.g["conjure#log#wrap"] = true
vim.g["conjure#mapping#def_word"] = false
vim.g["conjure#mapping#doc_word"] = false

-- runner stuff

vim.g["conjure#client#clojure#nrepl#test#call_suffix"] = ""
vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojure"
-- vim.g["conjure#client#clojure#nrepl#test#call_suffix"] = "{:kaocha/color? false :kaocha/reporter [kaocha.report/result] :capture-output? false}"
-- vim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
