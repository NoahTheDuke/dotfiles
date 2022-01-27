syntax keyword clojureSpecial clojure.core/fn fn nextgroup=clojureFunction skipwhite
syntax keyword clojureDefine clojure.core/defn clojure.core/defn- defn defn- nextgroup=clojureFunction skipwhite
syntax match clojureFunction "\%(\%(defn\|defn-\|fn\)\s*\)\@<=\h\k\+" contained
syntax match clojureInlineFunction "\v\(@<=%([a-zA-Z!$&*_+=|<.>?-]|[^\x00-\x7F])+%(:?%([a-zA-Z0-9!#$%&*_+=|'<.>/?-]|[^\x00-\x7F]))*[#:]@1<!"

" syntax cluster clojureTop remove=clojureDefine,clojureFunction,clojureSpecial
syntax cluster clojureTop add=clojureInlineFunction,clojureDefine,clojureFunction,clojureSpecial

highlight link clojureFunction                  Function
highlight link clojureInlineFunction            Function
highlight link clojureFunc                      Type
