; extends

(var_quoting_lit) @punctuation.special
(derefing_lit) @punctuation.special

((dis_expr "#_" @preproc)
 (#set! "priority" 105))

;(list_lit
;  .
;  (sym_lit) @include
;  (#eq? @include "ns")
;  .
;  (sym_lit) @namespace
;  [
;   (list_lit
;     (kwd_lit) @_require
;     (#eq? @_require ":require")
;     (vec_lit
;       [
;        (
;         (kwd_lit) @_require_as
;         (#eq? @_require_as ":as")
;         .
;         (sym_lit) @_as_item)? @_as_outside
;        (
;         (kwd_lit) @_require_refer
;         (#eq? @_require_refer ":refer")
;         .
;         (vec_lit (sym_lit)* @refered_items) @refer_item)? @_refer_outside
;         (_) @_catch_all
;        ]?
;       ) @_require_block
;     )? @_another
;     (_) @_whatever
;   ]?
;  ) @_last_one
