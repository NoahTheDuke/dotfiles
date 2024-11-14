(local utils (require :utils))

[

 ;; lua support
 (utils.dep
   "https://github.com/nvim-lua/plenary.nvim.git"
   {:name "plenary.nvim"})

 ;; bug fixes
 ;; Pure security
 (utils.dep
   "https://github.com/ypcrts/securemodelines"
   {:name "securemodelines"})

 ;; core functionality
 ;; :BD :BW
 (utils.dep
   "https://github.com/qpkorr/vim-bufkill"
   {:name "vim-bufkill"})

 ;; :Rename
 (utils.dep
   "https://github.com/ReekenX/vim-rename2"
   {:name "vim-rename2"})

 ;; :UndotreeToggle
 (utils.dep
   "https://github.com/mbbill/undotree"
   {:name "undotree"
    :branch "search"})

 ;; git stuff
 ;; :Git [blah blah]
 (utils.dep
   "https://github.com/tpope/vim-fugitive"
   {:name "vim-fugitive"})

 ;; :GitBrowse
 (utils.dep
   "https://github.com/tpope/vim-rhubarb"
   {:name "vim-rhubarb"})

 ;; :A etc
 (utils.dep
   "https://github.com/tpope/vim-projectionist"
   {:name "vim-projectionist"})

 (utils.dep
   "https://github.com/tpope/vim-repeat"
   {:name "vim-repeat"})

 ;; [b ]b etc
 (utils.dep
   "https://github.com/tpope/vim-unimpaired"
   {:name "vim-unimpaired"})

 ;; matching and movement
 (utils.dep
   "https://github.com/andymass/vim-matchup"
   {:name "vim-matchup"})

 (utils.dep
   "https://github.com/wellle/targets.vim"
   {:name "targets.vim"})

 (utils.dep
   "https://github.com/walterl/conjure-macroexpand"
   {:dependencies [ "Olical/conjure" ]})

 (utils.dep
   "https://github.com/walterl/conjure-locstack"
   {:dependencies [ "Olical/conjure" ]})

 ;; language plugins
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
