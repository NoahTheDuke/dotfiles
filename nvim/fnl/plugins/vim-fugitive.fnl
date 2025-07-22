(local utils (require :utils))

(fn str-split [str sep]
  (let [sep (or sep "%s")
        t {}]
    (each [s _ (str:gmatch (.. "([^" sep "]+)"))]
      (table.insert t s))
    t))

(fn vim.g.tangled_handler
  [opts]
  (let [{: path
         : line1
         : line2
         : remote
         : commit} opts
        path (or path "")
        path (path:gsub "^/" "")]
    (when (not= nil (remote:find "tangled.sh"))
      (let [parts [(unpack (str-split remote ":") 2)]
            project-path (.. "@" (table.concat parts "/") "/")
            project-url (.. "https://tangled.sh/" project-path)
            url (.. project-url "blob/" commit)]
        (if (= "" path)
          url
          (.. url "/" path))))))

(vim.cmd "
function! TangledHandler(opts, ...)
  return g:tangled_handler(a:opts)
endfunction
")

(fn tangled-config []
  (when (not vim.g.fugitive_browse_handlers)
    (vim.cmd "let g:fugitive_browse_handlers = []"))
  (vim.cmd "call insert(g:fugitive_browse_handlers, function('TangledHandler'))"))

;; git stuff
;; :Git [blah blah]
[(utils.dep
   "https://github.com/tpope/vim-fugitive"
   {:name "vim-fugitive"
    :config (fn [] (tangled-config))})]
