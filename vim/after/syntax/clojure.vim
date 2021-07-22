syntax keyword clojureSpecial clojure.core/fn fn nextgroup=clojureFunction skipwhite
syntax keyword clojureDefine clojure.core/defn clojure.core/defn- defn defn- nextgroup=clojureFunction skipwhite
syntax match clojureFunction "\%(\%(defn\|defn-\|fn\)\s*\)\@<=\h\k\+" contained
syntax match clojureInlineFunction "\v\(@<=%([a-zA-Z!$&*_+=|<.>?-]|[^\x00-\x7F])+%(:?%([a-zA-Z0-9!#$%&*_+=|'<.>/?-]|[^\x00-\x7F]))*[#:]@1<!"

syntax cluster clojureTop remove=clojureDefine,clojureFunction,clojureSpecial
syntax cluster clojureTop add=clojureDefine,clojureFunction,clojureInlineFunction,clojureSpecial

highlight default link clojureFunction                  Function
highlight default link clojureInlineFunction            Function
highlight default link clojureFunc                      Type
