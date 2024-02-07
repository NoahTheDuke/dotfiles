local function setup()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")
  local headers = require("utils.headers")
  local lazy_plugins = vim.tbl_map(function(plugin)
    return plugin.name
  end, require("lazy").plugins())

  math.randomseed(os.time())
  dashboard.section.header.val = headers.random()

  dashboard.section.buttons.val = {
    dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("s", "  Load Session", ":SessionManager load_session<CR>"),
    dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
    dashboard.button("t", "  Find Text", ":Telescope live_grep<CR>"),
    dashboard.button("c", "  Configuration", ":e $MYVIMRC<CR>:cd %:h/../<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa!<CR>"),
  }

  local function footer()
    local version = " " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
    if lazy_plugins == nil then
      return version
    else
      local total_plugins = "   " .. #vim.tbl_keys(lazy_plugins) .. " Plugins"
      return version .. total_plugins
    end
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "AlphaFooter"
  dashboard.section.header.opts.hl = "AlphaHeader"
  dashboard.section.buttons.opts.hl = "AlphaButton"

  dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.opts)
end

-- Splash screen
return {
  "https://github.com/goolord/alpha-nvim",
  name = "alpha",
  config = function(_plugin, _opts, run)
    if run then
      setup()
    end
  end,
}
