(fn nvim_ex [...]
  (-> (vim.iter [...])
      (: :flatten)
      (: :totable)
      (table.concat " ")
      (vim.api.nvim_command)))

(λ dep [name ?args]
  (if (not= ?args nil)
    (do (table.insert ?args 1 name)
      ?args)
    [name]))

(λ fennel_includeexpr [mdl]
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

(λ ks-opts [desc]
  "sets silent and noremap, uses given description"
  {:silent true
   :noremap true
   : desc})


{: dep
 : nvim_ex
 : fennel_includeexpr
 : ks-opts}
