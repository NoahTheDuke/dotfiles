;; ported to lua from https://github.com/ReekenX/vim-rename2

(λ rename [{:args name : bang}]
  (let [cur-file (vim.fn.expand "%:p")
        cur-file-stripped (vim.fn.substitute cur-file " " "\\\\ " :g)
        cur-file-path (vim.fn.expand "%:p:h")
        new-name (vim.fn.substitute (.. cur-file-path "/" name) " " "\\\\ " :g)]
    (set vim.v.errmsg "")
    (vim.print :fuck)
    (vim.cmd {:cmd "saveas" :args [new-name] : bang})
    (if (string.find vim.v.errmsg "^$|^E329")
      (let [new-cur-file (vim.fn.expand "%:p")]
        (when (and (not= cur-file new-cur-file)
                   (vim.fn.filewritable new-cur-file))
          (vim.cmd.bwipe cur-file-stripped {:bang true})
          (when (not= 0 (vim.fn.delete cur-file))
            (vim.notify (.. "Could not delete " cur-file) vim.log.levels.ERROR))))
      (vim.notify vim.v.errmsg vim.log.levels.ERROR))))

(vim.api.nvim_create_user_command
  :Rename
  (λ [opts] (rename opts))
  {:nargs :*
   :complete :file_in_path
   :bang true})
