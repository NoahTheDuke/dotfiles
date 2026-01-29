(fn g_set [k v]
  (if (= 0 (vim.api.nvim_call_function :exists k))
    (tset vim.g k v)))

(fn nvim_ex [...]
  (-> (vim.tbl_flatten [...])
      (table.concat " ")
      (vim.api.nvim_command)))

(fn dep [name args]
  (if (not= args nil)
    (do (table.insert args 1 name)
      args)
    [name]))

(fn map [f coll]
  "icollect but a function"
  (icollect [_ v (ipairs coll)]
    (f v)))

(fn filter [pred coll]
  "icollect but a function"
  (icollect [_ v (ipairs coll)]
    (if (pred v) v nil)))

{: g_set
 : dep
 : nvim_ex
 : map
 : filter}
