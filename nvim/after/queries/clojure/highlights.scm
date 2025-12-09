; extends

(var_quoting_lit) @punctuation.special
(derefing_lit) @punctuation.special

((dis_expr "#_" @preproc)
 (#set! "priority" 105))
