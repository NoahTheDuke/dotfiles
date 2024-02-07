-- common lisp
return {
  "https://github.com/vlime/vlime",
  ft = "lisp",
  config = function(plugin)
    vim.opt.rtp:append(plugin.dir .. "/vim")
  end,
}
