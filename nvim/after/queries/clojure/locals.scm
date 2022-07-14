;; scoping rules in here

((list_lit . (sym_lit) @_defsym . (sym_lit) @definition.var)
 (#match? @_defsym "^(clojure.core/)?def(once)?$"))


((list_lit . (sym_lit) @_defnsym
           . (sym_lit) @definition.function (#set! definition.function.scope "parent")
           . (vec_lit))
 (#match? @_defnsym "^(clojure.core/)?defn-?$")) @local.scope

((list_lit . (sym_lit) @_fnsym
           . (sym_lit)? @definition.function (#set! definition.function.scope "parent")
           . (vec_lit))
 (#match? @_fnsym "^(clojure.core/)?fn$")) @local.scope


((list_lit . (sym_lit) @_bindingblock
           . (vec_lit))
 (#match? @_bindingblock "^(clojure.core/)?(let|when-let|for|with-open|binding)$")) @local.scope

(sym_lit) @local.reference
