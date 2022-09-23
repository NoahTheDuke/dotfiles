syntax match clojureFunction "\v%(\(\s*%(clojure.core\/)?%(defn|defn-|fn)\s*)@<=\h\k+" contained
syntax match clojureInlineFunction "\v\(@<=%([a-zA-Z!$&*_+=|<.>?-]|[^\x00-\x7F])+%(:?%([a-zA-Z0-9!#$%&*_+=|'<.>/?-]|[^\x00-\x7F]))*[#:]@1<!"
" syntax match clojureJavaClassNew "\v\(@<=%([a-zA-Z!$&*_+=|<.>?-]|[^\x00-\x7F])+%(:?%([a-zA-Z0-9!#$%&*_+=|'<.>/?-]|[^\x00-\x7F]))*[#:]@1<!\.%(\s|\))@="

" ( fn there)
" (clojure.core/fn there)
" (hello: 'there)
" (hello# 'there)
" (hello. 'there)
" (hello.)

" syntax cluster clojureTop remove=clojureDefine,clojureFunction,clojureSpecial
syntax cluster clojureTop add=clojureInlineFunction,clojureJavaClassNew,clojureDefine,clojureFunction,clojureSpecial

highlight link clojureFunction       Function
highlight link clojureInlineFunction Function
" highlight link clojureJavaClassNew   StorageClass
highlight link clojureFunc           StorageClass
