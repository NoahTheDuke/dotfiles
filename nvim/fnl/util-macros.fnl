;; fennel-ls: macro-file
;; [nfnl-macro]

(fn when-require [[lib path] ...]
  `(let [(status-ok# ,lib) (pcall require ,path)]
     (when status-ok#
       ,...)))

{: when-require}
