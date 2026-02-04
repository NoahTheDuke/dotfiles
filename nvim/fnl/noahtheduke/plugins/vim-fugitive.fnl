(local utils (require "noahtheduke.utils"))

(λ str-split [str sep]
  (let [sep (or sep "%s")
        t {}]
    (each [s _ (str:gmatch (.. "([^" sep "]+)"))]
      (table.insert t s))
    t))

(λ _G.tangled_handler
  [opts]
  (let [{: path
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
  return v:lua.tangled_handler(a:opts)
endfunction
")

(λ config []
  (vim.cmd
    "
    if !exists('g:fugitive_browse_handlers')
      let g:fugitive_browse_handlers = []
    endif
    if index(g:fugitive_browse_handlers, function('TangledHandler')) < 0
      call insert(g:fugitive_browse_handlers, function('TangledHandler'))
    endif
    "))

;; git stuff
;; :Git [blah blah]
[(utils.dep
   "https://github.com/tpope/vim-fugitive"
   {:name "vim-fugitive"
    :config config})]
