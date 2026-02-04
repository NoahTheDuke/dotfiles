(local utils (require "noahtheduke.utils"))

(fn config
  []
  (let [dracula (require "dracula")
        colors (dracula.colors)]
    (dracula.setup
      {:overrides
       {:Normal {:fg colors.fg :bg colors.bg}
        :Terminal {:fg colors.fg :bg colors.bg}
        :Comment {:fg colors.comment}

        :Constant {:fg colors.purple}
        :String {:fg colors.yellow}
        :Character {:fg colors.purple}
        :Number {:fg colors.purple}
        :Boolean {:fg colors.purple}
        :Float {:fg colors.purple}

        :Identifier {:fg colors.fg :bg colors.bg}
        :Function {:fg colors.green}

        :Statement {:fg colors.pink}
        :Conditional {:fg colors.pink}
        :Repeat {:fg colors.pink}
        :Label {:fg colors.pink}
        :Operator {:fg colors.orange}
        :Keyword {:fg colors.pink}
        :Exception {:fg colors.pink}

        :PreProc {:fg colors.orange}
        :Include {:fg colors.orange}
        :Define {:fg colors.cyan}
        :Macro {:fg colors.orange}
        :PreCondit {:fg colors.orange}

        :Type {:fg colors.cyan}
        :StorageClass {:fg colors.cyan}
        :Structure {:fg colors.cyan}
        :Typedef {:fg colors.cyan}

        :Special {:fg colors.pink}
        :SpecialKey {:fg colors.red}
        :SpecialChar {:fg colors.orange}
        :Tag {:fg colors.fg}
        :Delimiter {:fg colors.fg}
        :SpecialComment {:fg colors.comment :bg nil}
        :Debug {:fg colors.fg}

        :Ignore {:fg colors.comment}

        ;; TreeSitter Highlighting
        "@character" {:link :Character}
        "@comment" {:link :Comment}
        "@constant.builtin" {:link :Constant}
        "@function.call" {:link :Function}
        "@function.macro" {:link :Macro}
        "@operator" {:link :Operator}
        "@punctuation.special" {:fg colors.orange}
        "@string" {:link :String}
        "@string.regexp" {:fg colors.purple}
        "@string.special" {:fg colors.purple}
        "@string.special.symbol" {:fg colors.pink}
        "@variable.builtin" {:fg colors.cyan}

        ;; lsp highlighting
        "@lsp.type.macro" {:link :Macro}
        :DiagnosticUnnecessary {:undercurl true}

        ;; statusline stuff
        ;; Mode
        :User1 {:fg colors.bg
                :bg colors.purple
                :bold true}
        :User2 {:fg colors.fg
                :bg colors.comment}
        :User3 {:fg colors.fg
                :bg colors.selection}}}))
  (vim.cmd.colorscheme "dracula")
  nil)

; (config)

[(utils.dep
   "https://github.com/Mofiqul/dracula.nvim"
   {:priority 1000
    :config config})]
