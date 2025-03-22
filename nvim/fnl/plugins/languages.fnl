(local utils (require :utils))

[

 ;; asciidoc
 (utils.dep
   "https://github.com/asciidoc/vim-asciidoc"
   {:ft "asciidoc"})

 ;; asm
 (utils.dep
   "https://github.com/samsaga2/vim-z80"
   {:ft "asm"})

 ;; docker-compose
 (utils.dep
   "https://github.com/ekalinin/Dockerfile.vim"
   {:ft "dockerfile"})

 ;; fennel
 (utils.dep
   "https://github.com/jaawerth/fennel.vim"
   {:ft "fennel"})

 (utils.dep
   "https://github.com/projectfluent/fluent.vim.git"
   {:ft "fluent"})

 ;; git
 (utils.dep
   "https://github.com/tpope/vim-git"
   {:name "vim-git"})

 ;; html5
 (utils.dep
   "https://github.com/othree/html5.vim"
   {:ft "html"})

 ;; javascript
 (utils.dep
   "https://github.com/pangloss/vim-javascript"
   {:ft "javascript"})

 ;; json5
 (utils.dep
   "https://github.com/GutenYe/json5.vim"
   {:ft "json5"})

 ;; jsonc
 (utils.dep
   "https://github.com/neoclide/jsonc.vim"
   {:ft "jsonc"})

 ;; justfiles
 (utils.dep
   "https://github.com/NoahTheDuke/vim-just"
   {:ft "just"})

 ;; markdown
 (utils.dep
   "https://github.com/plasticboy/vim-markdown"
   {:ft "markdown"})

 ;; ocaml
 (utils.dep
   "https://github.com/ocaml/vim-ocaml"
   {:ft "ocaml"})

 ;; python
 (utils.dep
   "https://github.com/psf/black"
   {:ft "python"})

 ;; racket
 (utils.dep
   "https://github.com/wlangstroth/vim-racket"
   {:ft "racket"})

 ;; rst
 (utils.dep
   "https://github.com/marshallward/vim-restructuredtext"
   {:name "vim-restructuredtext"})

 ;; ruby/rails
 (utils.dep
   "https://github.com/vim-ruby/vim-ruby"
   {:ft "ruby"})

 (utils.dep
   "https://github.com/tpope/vim-rails"
   {:ft "ruby"})

 ;; rust
 (utils.dep
   "https://github.com/rust-lang/rust.vim"
   {:ft "rust"})

 ;; sh/bash/etc
 (utils.dep
   "https://github.com/arzg/vim-sh"
   {:name "vim-sh"})

 ;; stylus
 (utils.dep
   "https://github.com/wavded/vim-stylus"
   {:ft "stylus"})

 ;; toml
 (utils.dep
   "https://github.com/cespare/vim-toml"
   {:ft "toml"})

 ;; twig
 (utils.dep
   "https://github.com/lumiliet/vim-twig"
   {:ft "twig"})

 ;; typescript
 (utils.dep
   "https://github.com/HerringtonDarkholme/yats.vim"
   {:ft "typescript"})

 ;; xml
 (utils.dep
   "https://github.com/amadeus/vim-xml"
   {:ft "xml"})

 ;; zig
 (utils.dep
   "https://github.com/ziglang/zig.vim"
   {:ft "zig"})

]
