(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ setup-custom-langs []
  (vim.api.nvim_create_autocmd
    "User"
    {:pattern ["TSUpdate"]
     :callback
     (λ []
       (when-require [ts-parsers "nvim-treesitter.parsers"]
         (set ts-parsers.asciidoc
              {:install_info
               {:url "https://github.com/cathaysia/tree-sitter-asciidoc.git"
                :branch "master"
                :location "tree-sitter-asciidoc"
                :queries "queries"}})
         (set ts-parsers.asciidoc_inline
              {:install_info
               {:url "https://github.com/cathaysia/tree-sitter-asciidoc.git"
                :branch "master"
                :location "tree-sitter-asciidoc_inline"
                :queries "queries"}})
         (set ts-parsers.talon
              {:install_info
               {:url "https://github.com/wenkokke/tree-sitter-talon.git"
                :files ["src/parser.c"
                        "src/scanner.c"]
                :branch "dev"}})))}))

(local all-languages
  ["asciidoc"
   "asciidoc_inline"
   "angular"
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
   "talon"
   "typescript"
   "vimdoc"
   "vue"
   "yaml"])

(λ start-lang [language]
  (vim.api.nvim_create_autocmd
    "FileType"
    {:pattern [language]
     :callback (λ [] (vim.treesitter.start))}))

(λ config []
  (when-require [ts "nvim-treesitter"]
    (setup-custom-langs)
    (ts.install all-languages)
    (each [_ language (ipairs all-languages)]
      (start-lang language))
    (vim.treesitter.language.register "clojure" ["basilisp"])
    (vim.treesitter.language.register "scheme" ["dune"])
    nil))

(comment
  (config))

(λ mod-config []
  (when-require [mods "treesitter-modules"]
    (mods.setup {:incremental_selection {:enable true}})))

[(utils.dep
   "https://github.com/nvim-treesitter/nvim-treesitter"
   {:config config
    :branch "main"
    :revision "HEAD"
    :build ":TSUpdate"})
 (utils.dep
   "https://github.com/MeanderingProgrammer/treesitter-modules.nvim"
   {:dependencies ["nvim-treesitter/nvim-treesitter"]
    :config mod-config})]
