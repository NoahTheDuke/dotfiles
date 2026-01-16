;; fennel-ls: macro-file
;; [nfnl-macro]

(fn when-require [args ...]
  (let [gensyms []
        binds (icollect [_ v (ipairs args)]
                (if (sym? v)
                  (let [g (gensym)]
                    (table.insert gensyms g)
                    `(,g ,v))
                  `(pcall require ,v)))]
    `(let [,(unpack binds)]
       (when (and ,(unpack gensyms))
         ,...))))

{: when-require}
