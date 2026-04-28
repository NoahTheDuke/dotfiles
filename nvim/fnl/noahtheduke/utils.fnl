(local M {})

(λ M.nvim_ex [...]
  (-> (vim.iter [...])
      (: :flatten)
      (: :totable)
      (table.concat " ")
      (vim.api.nvim_command)))

; { true,
;   branch = true,
;   build = true,
;   cmd = true,
;   commit = true,
;   config = true,
;   ft = true,
;   lazy = true,
;   name = true,
;   opts = true,
;   priority = true,
;   revision = true
; }

(λ M.dep [url ?args]
  (let [dep (if (not= ?args nil)
              (do (table.insert ?args 1 url)
                ?args)
              [url])]
    dep))

(λ M.colorscheme [url ?args]
  (let [base {1 url
              :priority 1000
              :lazy false}]
    (if (not= ?args nil)
      (vim.tbl_extend :keep base ?args)
      base)))

(λ M.fennel_includeexpr [mdl]
  (let [mdl (mdl:gsub "%." "/")
        root (or (vim.fs.root (vim.api.nvim_buf_get_name 0) "lua")
                 (vim.fn.getcwd))]
    (each [_ fname (ipairs [mdl (vim.fs.joinpath root "fnl" mdl)])]
      (each [_ suf (ipairs [".fnl" ".fnlm"])]
        (let [path (.. fname suf)]
          (if (vim.uv.fs_stat path)
            (lua "return path"))))))
  (let [mod-info (. (vim.loader.find mdl) 1)]
    (or (and mod-info mod-info.modpath) mdl)))

(comment
  (fennel_includeexpr "noahtheduke.util-macros"))

(λ M.ks-opts [desc]
  "sets silent and noremap, uses given description"
  {:silent true
   :noremap true
   : desc})

M
