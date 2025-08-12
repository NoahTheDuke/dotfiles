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

{: g_set
 : dep
 : nvim_ex}
