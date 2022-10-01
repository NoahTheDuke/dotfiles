local function get_git_head()
  local head = vim.call("FugitiveHead")
  if head == "" or head == nil then
    return "DETATCHED "
  end
  if string.len(head) > 20 then
    head = ".." .. head:sub(15)
  end
  return " " .. head
end

require("lualine").setup({
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    theme = "dracula",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { get_git_head },
    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 1,
        symbols = {
          modified = "  ",
          readonly = "[-]",
          unnamed = "[No Name]",
        },
      },
      {
        "diagnostics",
        sources = { "coc" },
      },
    },
    lualine_x = {
      {
        "encoding",
        "fileformat",
      },
    },
    lualine_y = {
      {
        "filetype",
        colored = true,
      },
    },
    lualine_z = {
      { "%3p%%/%4L %4l:%3v" },
    },
  },
  extensions = {
    "quickfix",
    "fugitive",
    "nvim-tree",
  }
})
