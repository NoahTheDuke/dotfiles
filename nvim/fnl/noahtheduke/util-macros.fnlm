;; fennel-ls: macro-file
;; [nfnl-macro]

(fn when-require [args ...]
  (let [gensyms []
        errs (gensym "errors")
        binds (icollect [_ v (ipairs args)]
                (if (sym? v)
                  (let [g (gensym)]
                    (table.insert gensyms g)
                    `(,g ,v))
                  `(xpcall (fn [] (require ,v))
                           (fn [err#] (table.insert ,errs (debug.traceback err#))))))]
    `(let [,errs []
           ,(unpack binds)]
       (if (and ,(unpack gensyms))
         (do ,...)
         (vim.notify (. ,errs 1) vim.log.levels.ERROR)))))

(fn callback [args ...]
  `(fn ,args
     (do ,...)
     nil))


{: when-require
 : callback}
