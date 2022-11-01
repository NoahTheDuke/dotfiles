if vim.g.sexp_filetypes then
  local new_filetypes = { "fennel", "new_fennel" }

  for _, v in ipairs(new_filetypes) do
    if (not string.find(vim.g.sexp_filetypes, v)) then
      vim.g.sexp_filetypes = vim.g.sexp_filetypes .. ',' .. v
    end
  end
end
