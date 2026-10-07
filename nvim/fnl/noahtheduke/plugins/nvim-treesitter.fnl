(local utils (require "noahtheduke.utils"))
(import-macros {: callback : when-require} "noahtheduke.util-macros")

(local custom-langs
  {:asciidoc {:install_info
              {:url "https://github.com/cathaysia/tree-sitter-asciidoc.git"
               :branch "master"
               :location "tree-sitter-asciidoc"
               :queries "tree-sitter-asciidoc/queries"}}
   :asciidoc_inline {:install_info
                     {:url "https://github.com/cathaysia/tree-sitter-asciidoc.git"
                      :branch "master"
                      :location "tree-sitter-asciidoc_inline"
                      :queries "tree-sitter-asciidoc_inline/queries"}}
   ; :cucumber {:install_info
   ;            {:url "https://github.com/binhtddev/tree-sitter-gherkin.git"
   ;             :branch "main"
   ;             :files ["src/parser.c"
   ;                     "src/scanner.c"]
   ;             :queries "queries/gherkin"}}
   :talon {:install_info
           {:url "https://github.com/wenkokke/tree-sitter-talon.git"
            :files ["src/parser.c"
                    "src/scanner.c"]
            :branch "dev"}}})

(λ setup-custom-langs []
  (vim.api.nvim_create_autocmd
    "User"
    {:pattern ["TSUpdate"]
     :callback (callback []
                 (when-require [ts-parsers "nvim-treesitter.parsers"]
                   (each [lang cfg (pairs custom-langs)]
                     (set (. ts-parsers lang) cfg))))}))

(local all-languages
  ["angular"
   "clojure"
   "cooklang"
   "djot"
   "fennel"
   "java"
   "javascript"
   "json"
   "json5"
   "just"
   "lua"
   "make"
   "markdown"
   "markdown_inline"
   "ocaml"
   "ocaml_interface"
   "ocamllex"
   "python"
   "query"
   "racket"
   "rust"
   "scheme"
   "sql"
   "svelte"
   "terraform"
   "typescript"
   "vimdoc"
   "vue"
   "xml"
   "yaml"])

(λ start-lang [language]
  (vim.api.nvim_create_autocmd
    "FileType"
    {:pattern [language]
     :callback (λ [] (vim.treesitter.start))}))

(λ config []
  (when-require [ts "nvim-treesitter"]
    (setup-custom-langs)
    (each [k _ (pairs custom-langs)]
      (table.insert all-languages k))
    (ts.install all-languages)
    (each [_ language (ipairs all-languages)]
      (start-lang language))
    (vim.treesitter.language.register "clojure" ["basilisp"])
    (vim.treesitter.language.register "scheme" ["dune"])
    nil))

(comment
  (config))

[(utils.dep
   "https://github.com/nvim-treesitter/nvim-treesitter"
   {:config config
    :branch "main"
    :revision "HEAD"
    :build ":TSUpdate"})
 (utils.dep
   "https://github.com/nvim-treesitter/nvim-treesitter-context")]
