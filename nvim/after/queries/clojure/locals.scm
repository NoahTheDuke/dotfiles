;; scoping rules in here

(list_lit
  . (sym_lit) @_defsym
  . (sym_lit) @definition.var
  (#match? @_defsym "^(clojure.core/)?def(once)?$"))

(list_lit
  . (sym_lit) @_defn_sym
  . (sym_lit) @definition.function (#set! "definition.var.scope" "global")
  . (str_lit)?
  . (map_lit)?
  . [;; no overloads
     ((vec_lit
        value: (sym_lit) @definition.parameter)
      (map_lit)?)
     ;; multi overloads
     ((list_lit
        ((vec_lit
           value: (sym_lit) @definition.parameter)
         (map_lit)?))
      (map_lit)?)]
  (#match? @_defn_sym "^(clojure.core/)?defn-?$")) @scope

(list_lit
  . (sym_lit) @_fnsym
  . (sym_lit)? @definition.function (#set! "definition.var.scope" "parent")
  . (vec_lit)
  (#match? @_fnsym "^(clojure.core/)?fn$")) @scope


(list_lit
  . (sym_lit) @_binding_block
  . (vec_lit)
  (#match? @_binding_block "^(clojure.core/)?(let|when-let|for|with-open|binding)$")) @local.scope

(sym_lit) @local.reference

; ((sym_lit) @function.method
;  (#is-not? local))
