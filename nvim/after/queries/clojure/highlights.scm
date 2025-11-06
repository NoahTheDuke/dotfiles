; extends

; General function calls
(list_lit
  meta: (_)?
  .
  value:
  (sym_lit) @function.call)

(anon_fn_lit
  meta: (_)?
  .
  value:
  (sym_lit) @function.call)

(var_quoting_lit) @punctuation.special
(derefing_lit) @punctuation.special

((dis_expr "#_" @preproc)
 (#set! "priority" 105))
